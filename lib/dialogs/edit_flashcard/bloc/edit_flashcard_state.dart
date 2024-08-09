part of 'edit_flashcard_bloc.dart';

@freezed
class EditFlashcardState with _$EditFlashcardState {
  const factory EditFlashcardState({
    required Flashcard flashcard,
    @Default(false) isSubmitting,
  }) = _EditFlashcardState;
}
