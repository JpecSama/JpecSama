import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/extensions/string_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';
import 'package:jpec_sama/models/flashcard_session_answer.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final List<Flashcard> flashcards;

  ReviewBloc({
    required this.flashcards,
  }) : super(ReviewState(
          flashcards: flashcards,
          sessionAnswers: [],
        )) {
    on<_CardReview>(_onCardReviewed);
    on<_SessionCanceled>(_onSessionCanceled);
    on<_SessionSaved>(_onSessionSaved);
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
    for (var possibleAnswer in possibleAnswers) {
      //todo add levenstein
      if (possibleAnswer.answer.toComparableString() ==
          event.givenAnswer.toComparableString()) {
        isCorrect = true;
      }
    }
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
            givenAnswer: event.givenAnswer,
            isCorrect: isCorrect,
          ),
        ],
      ),
    );
  }

  _onSessionCanceled(_SessionCanceled event, Emitter<ReviewState> emit) {
    emit(state);
  }

  _onSessionSaved(_SessionSaved event, Emitter<ReviewState> emit) {
    emit(state);
  }
}
