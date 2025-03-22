part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.started() = _Started;
  const factory ReviewEvent.alwaysShowAnswerToggled() = _AlwaysShowAnswerToggled;
  const factory ReviewEvent.cardReviewed({required String givenAnswer}) =
      _CardReview;
  const factory ReviewEvent.nextCard() = _NextCard;
  const factory ReviewEvent.sessionSaved() = _SessionSaved;
  const factory ReviewEvent.sessionCanceled() = _SessionCanceled;
  const factory ReviewEvent.hintToggled() = _HintToggled;
  const factory ReviewEvent.currentCardEdited({
    required Flashcard flashcard,
  }) = _CurrentCardEdited;
}
