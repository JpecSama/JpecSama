part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const ReviewState._();

  const factory ReviewState({
    String? submissionError,
    @Default(0) int answerCount,
    @Default(false) bool isInitialising,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSessionEnded,
    //
    @Default(false) bool hasReviewError,
    @Default(false) bool isHintVisible,
    @Default(false) bool isAnswerVisible,
    String? currentCardId,
    required List<Flashcard> flashcards,
    required List<FlashcardSessionAnswer> sessionAnswers,
  }) = _ReviewState;

  Flashcard? get currentCard {
    return currentCardId != null
        ? flashcards.where((card) => card.id == currentCardId).firstOrNull
        : null;
  }

  int? get currentCardIndex => currentCardId != null
      ? flashcards.indexWhere((card) => card.id == currentCardId)
      : null;

  factory ReviewState.fromJson(Map<String, Object?> json) =>
      _$ReviewStateFromJson(json);
}
