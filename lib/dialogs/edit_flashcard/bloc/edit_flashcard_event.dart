part of 'edit_flashcard_bloc.dart';

@freezed
class EditFlashcardEvent with _$EditFlashcardEvent {
  const factory EditFlashcardEvent.started() = _Started;
  const factory EditFlashcardEvent.submitted() = _Submitted;
}