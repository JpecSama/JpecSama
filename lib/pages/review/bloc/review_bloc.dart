import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jpec_sama/extensions/string_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';
import 'package:jpec_sama/models/flashcard_session_answer.dart';
import 'package:jpec_sama/repositories/review_repository.dart';
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
  }

  _onStarted(_Started event, Emitter<ReviewState> emit) async {
    emit(
      state.copyWith(
        isInitialising: true,
      ),
    );
    List<Flashcard> flashcards = await _repo.getCardsToReview(maxCount);
    flashcards.shuffle();
    emit(state.copyWith(
      flashcards: flashcards,
      currentCardId: flashcards.firstOrNull?.id,
      isInitialising: false,
    ));
  }

  _onCurrentCardEdited(_CurrentCardEdited event, Emitter<ReviewState> emit) {
    List<Flashcard> flashcards = [...state.flashcards];
    flashcards[state.currentCardIndex!] = event.flashcard;
    emit(state.copyWith(flashcards: flashcards));
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

    for (var possibleAnswer in possibleAnswers) {
      List<String> givenAnswers = [
        givenAnswer.toComparableString(),
        ...alternativeGivenAnswers
      ];
      //todo add levenstein
      if (givenAnswers.contains(possibleAnswer.answer.toComparableString())) {
        usedAnswer = possibleAnswer;
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

  _onCardReviewed(_CardReview event, Emitter<ReviewState> emit) {
    if (state.hasReviewError) {
      emit(
        state.copyWith(
          hasReviewError: false,
          isAnswerVisible: false,
          isHintVisible: false,
          currentCardId: _getRandomCardId(state.flashcards),
        ),
      );
      return;
    }

    FlashcardAnswer? usedAnswer =
        getUsedAnswerIfCorrect(state.currentCard!, event.givenAnswer);
    bool isCorrect = usedAnswer != null;

    final currentCard = state.currentCard!;
    int newLevel = currentCard.level + (isCorrect ? 1 : -1);

    List<Flashcard> newFlashcards = [...state.flashcards];
    List<FlashcardSessionAnswer> answers = [
      ...state.sessionAnswers,
    ];

    if (answers
        .where((answer) => answer.flashCard.id == state.currentCardId)
        .isEmpty) {
      answers.add(FlashcardSessionAnswer(
        flashCard: currentCard.copyWith(level: newLevel >= 0 ? newLevel : 0),
        flashCardAnswer: usedAnswer,
        givenAnswer: event.givenAnswer,
        isCorrect: isCorrect,
      ));
    }
    if (isCorrect) {
      newFlashcards.removeAt(state.currentCardIndex!);
    }
    String? currentCardId =
        isCorrect ? _getRandomCardId(newFlashcards) : state.currentCardId;

    emit(
      state.copyWith(
        flashcards: newFlashcards,
        hasReviewError: !isCorrect,
        isAnswerVisible: !isCorrect,
        currentCardId: currentCardId,
        isHintVisible: false,
        sessionAnswers: answers,
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
