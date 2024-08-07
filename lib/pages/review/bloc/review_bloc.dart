import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jpec_sama/extensions/string_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';
import 'package:jpec_sama/models/flashcard_session_answer.dart';
import 'package:jpec_sama/repositories/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';
part 'review_bloc.g.dart';

class ReviewBloc extends HydratedBloc<ReviewEvent, ReviewState> {
  final _repo = ReviewRepository();

  @override
  ReviewState fromJson(Map<String, dynamic> json) => json['isSessionEnded']
      ? const ReviewState(
          flashcards: [],
          sessionAnswers: [],
        )
      : ReviewState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ReviewState state) => state.toJson();

  ReviewBloc()
      : super(const ReviewState(
          flashcards: [],
          sessionAnswers: [],
        )) {
    on<_CardReview>(_onCardReviewed);
    on<_Started>(_onStarted);
    on<_SessionCanceled>(_onSessionCanceled);
    on<_SessionSaved>(_onSessionSaved);
    on<_HintToggled>(_onHintToggled);
  }

  _onStarted(_Started event, Emitter<ReviewState> emit) async {
    emit(state.copyWith(isInitialising: true));
    List<Flashcard> flashcards = await _repo.getCardsToReview();
    flashcards.shuffle();
    emit(state.copyWith(flashcards: flashcards, isInitialising: false));
  }

  _onCardReviewed(_CardReview event, Emitter<ReviewState> emit) {
    if (state.hasReviewError) {
      emit(state.copyWith(
        hasReviewError: false,
        isAnswerVisible: false,
        isHintVisible: false,
        currentCardIndex: state.currentCardIndex + 1,
      ));
      return;
    }
    List<FlashcardAnswer> possibleAnswers = state.currentCard!.flashcardAnswer;
    bool isCorrect = false;
    FlashcardAnswer? usedAnswer;
    for (var possibleAnswer in possibleAnswers) {
      //todo add levenstein
      if (possibleAnswer.answer.toComparableString() ==
          event.givenAnswer.toComparableString()) {
        isCorrect = true;
        usedAnswer = possibleAnswer;
      }
    }
    final currentCard = state.currentCard!;
    int newLevel = currentCard.level + (isCorrect ? 1 : -1);
    emit(
      state.copyWith(
        hasReviewError: !isCorrect,
        isAnswerVisible: !isCorrect,
        currentCardIndex:
            isCorrect ? state.currentCardIndex + 1 : state.currentCardIndex,
        isHintVisible: false,
        sessionAnswers: [
          ...state.sessionAnswers,
          FlashcardSessionAnswer(
            flashCard:
                currentCard.copyWith(level: newLevel >= 0 ? newLevel : 0),
            flashCardAnswer: usedAnswer,
            givenAnswer: event.givenAnswer,
            isCorrect: isCorrect,
          ),
        ],
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
