part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const ReviewState._();

  const factory ReviewState({
    String? submissionError,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSessionEnded,
    //
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

  factory ReviewState.fromJson(Map<String, Object?> json) =>
      _$ReviewStateFromJson(json);
}