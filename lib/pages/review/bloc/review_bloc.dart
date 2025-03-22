import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jpec_sama/extensions/string_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';
import 'package:jpec_sama/models/flashcard_session_answer.dart';
import 'package:jpec_sama/services/supabase/repositories/review_repository.dart';
import 'package:kana_romaji_translator/japanese_text_translator.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';
part 'review_bloc.g.dart';

class ReviewBloc extends HydratedBloc<ReviewEvent, ReviewState> {
  final _repo = ReviewRepository();
  final JapaneseTextTranslator japaneseTextTranslator =
      JapaneseTextTranslator();
  final int maxCount;

  @override
  ReviewState fromJson(Map<String, dynamic> json) => json['isSessionEnded']
      ? const ReviewState(
          flashcards: [],
          sessionAnswers: [],
        )
      : ReviewState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ReviewState state) => state.toJson();

  ReviewBloc({
    this.maxCount = 100,
  }) : super(
          const ReviewState(
            flashcards: [],
            sessionAnswers: [],
          ),
        ) {
    on<_Started>(_onStarted);
    on<_CardReview>(_onCardReviewed);
    on<_CurrentCardEdited>(_onCurrentCardEdited);
    on<_SessionCanceled>(_onSessionCanceled);
    on<_SessionSaved>(_onSessionSaved);
    on<_HintToggled>(_onHintToggled);
    on<_AlwaysShowAnswerToggled>(_onAlwaysShowAnswerToggled);
  }

  _onStarted(_Started event, Emitter<ReviewState> emit) async {
    emit(
      state.copyWith(
        isInitialising: true,
      ),
    );
    //
    List<Flashcard> flashcards = await _repo.getCardsToReview(maxCount);
    flashcards.shuffle();
    emit(
      state.copyWith(
        flashcards: flashcards,
        currentCardId: flashcards.firstOrNull?.id,
        isInitialising: false,
      ),
    );
  }

  _onCurrentCardEdited(_CurrentCardEdited event, Emitter<ReviewState> emit) {
    List<Flashcard> flashcards = [...state.flashcards];
    flashcards[state.currentCardIndex!] = event.flashcard;
    emit(state.copyWith(flashcards: flashcards));
  }

  int levenshtein(String a, String b) {
    int aLen = a.length;
    int bLen = b.length;

    if (aLen == 0) return bLen;
    if (bLen == 0) return aLen;

    List<List<int>> dp = List.generate(
      aLen + 1,
      (i) => List.filled(bLen + 1, 0),
    );

    for (int i = 0; i <= aLen; i++) {
      for (int j = 0; j <= bLen; j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        } else {
          int cost = a[i - 1] == b[j - 1] ? 0 : 1;
          dp[i][j] = [
            dp[i - 1][j] + 1, // Deletion
            dp[i][j - 1] + 1, // Insertion
            dp[i - 1][j - 1] + cost // Substitution
          ].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return dp[aLen][bLen];
  }

  bool isAcceptableAnswer(String expected, String given) {
    int length = expected.length;
    int threshold = length <= 4 ? 0 : (length <= 7 ? 1 : 2);

    return levenshtein(expected, given) <= threshold;
  }

  FlashcardAnswer? getUsedAnswerIfCorrect(
    Flashcard flashcard,
    String givenAnswer,
  ) {
    FlashcardAnswer? usedAnswer;
    List<FlashcardAnswer> possibleAnswers = flashcard.flashcardAnswer;
    List<String> alternativeGivenAnswers = flashcard.destLanguage == 'JA'
        ? [
            japaneseTextTranslator.getHiragana(
              givenAnswer,
              isStaticAnalysis: true,
            ),
            japaneseTextTranslator.getKatakana(
              givenAnswer,
              isStaticAnalysis: true,
            ),
          ]
        : [];

    String comparableGivenAnswer = givenAnswer.toComparableString();
    for (var possibleAnswer in possibleAnswers) {
      if (isAcceptableAnswer(
          possibleAnswer.answer.toComparableString(), comparableGivenAnswer)) {
        usedAnswer = possibleAnswer;
        break;
      }
      if (alternativeGivenAnswers
          .contains(possibleAnswer.answer.toComparableString())) {
        usedAnswer = possibleAnswer;
        break;
      }
    }
    return usedAnswer;
  }

  String? _getRandomCardId(List<Flashcard> flashcards) {
    if (flashcards.isEmpty) {
      return null;
    }
    List<String> cardIds = [...flashcards.map((card) => card.id!)];
    cardIds.shuffle();

    return cardIds.firstOrNull;
  }

  _updateCardsAndShowNext(
      Emitter<ReviewState> emit, bool shouldRemoveCurrentCard) {
    List<Flashcard> newFlashcards = [...state.flashcards];
    if (shouldRemoveCurrentCard) {
      newFlashcards.removeAt(state.currentCardIndex!);
    }
    String? currentCardId = _getRandomCardId(newFlashcards);

    emit(
      state.copyWith(
        flashcards: newFlashcards,
        hasReviewError: false,
        isAnswerVisible: false,
        isHintVisible: false,
        currentCardId: currentCardId,
      ),
    );
  }

  _addCurrentAnswerToSessionAnswers(
    Emitter<ReviewState> emit,
    String givenAnswer,
    FlashcardAnswer? usedAnswer,
  ) {
    bool isCorrect = usedAnswer != null;

    final currentCard = state.currentCard!;
    int newLevel = currentCard.level + (isCorrect ? 1 : -1);

    List<FlashcardSessionAnswer> answers = [
      ...state.sessionAnswers,
    ];

    if (answers
        .where((answer) => answer.flashCard.id == state.currentCardId)
        .isEmpty) {
      answers.add(
        FlashcardSessionAnswer(
          flashCard: currentCard.copyWith(level: newLevel >= 0 ? newLevel : 0),
          flashCardAnswer: usedAnswer,
          givenAnswer: givenAnswer,
          isCorrect: isCorrect,
        ),
      );
    }

    emit(
      state.copyWith(
        answerCount: state.answerCount + 1,
        sessionAnswers: answers,
      ),
    );
  }

  _onCardReviewed(_CardReview event, Emitter<ReviewState> emit) {
    if (state.isAnswerVisible) {
      _updateCardsAndShowNext(emit, !state.hasReviewError);
      return;
    }
    FlashcardAnswer? usedAnswer =
        getUsedAnswerIfCorrect(state.currentCard!, event.givenAnswer);
    bool isCorrect = usedAnswer != null;
    // Add card answer to session answers
    _addCurrentAnswerToSessionAnswers(emit, event.givenAnswer, usedAnswer);

    if (!isCorrect || state.shouldAlwaysShowAnswer) {
      emit(
        state.copyWith(
          hasReviewError: !isCorrect,
          isAnswerVisible: true,
        ),
      );
      return;
    }
    _updateCardsAndShowNext(emit, true);
  }

  _onAlwaysShowAnswerToggled(
      _AlwaysShowAnswerToggled event, Emitter<ReviewState> emit) {
    emit(
      state.copyWith(
        shouldAlwaysShowAnswer: !state.shouldAlwaysShowAnswer,
      ),
    );
  }

  _onHintToggled(_HintToggled event, Emitter<ReviewState> emit) {
    emit(state.copyWith(isHintVisible: true));
  }

  _onSessionCanceled(_SessionCanceled event, Emitter<ReviewState> emit) {
    emit(state.copyWith(isSessionEnded: true));
  }

  _onSessionSaved(_SessionSaved event, Emitter<ReviewState> emit) async {
    final repo = ReviewRepository();
    try {
      await repo.postReview(state.sessionAnswers);
    } catch (e) {
      print(e);
      emit(state.copyWith(
        isSessionEnded: true,
      ));
    }
    emit(state.copyWith(
      isSessionEnded: true,
    ));
  }
}
