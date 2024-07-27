part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const ReviewState._();

  const factory ReviewState({
    @Default(false) bool hasReviewError,
    @Default(false) bool isHintVisible,
    @Default(false) bool isAnswerVisible,
    @Default(0) int currentCardIndex,
    required List<Flashcard> flashcards,
    required List<FlashcardSessionAnswer> sessionAnswers,
  }) = _ReviewState;

  Flashcard? get currentCard => currentCardIndex < flashcards.length
      ? flashcards[currentCardIndex]
      : null;
}
