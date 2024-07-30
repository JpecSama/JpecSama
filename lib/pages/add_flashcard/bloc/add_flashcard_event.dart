part of 'add_flashcard_bloc.dart';

@freezed
class AddFlashcardEvent with _$AddFlashcardEvent {
  const factory AddFlashcardEvent.started() = _Started;

  const factory AddFlashcardEvent.reversableToggled() = _ReversableToggled;

  const factory AddFlashcardEvent.localeSwitched() = _LocaleSwitched;

  const factory AddFlashcardEvent.sourceLocaleChanged(
      {required String newLocale}) = _SourceLocaleChanged;

  const factory AddFlashcardEvent.destLocaleChanged(
      {required String newLocale}) = _DestLocaleChanged;

  const factory AddFlashcardEvent.formSubmitted() = _FormSubmitted;

  const factory AddFlashcardEvent.searchTextChanged(
      {required String searchText}) = _SearchTextChanged;
}
