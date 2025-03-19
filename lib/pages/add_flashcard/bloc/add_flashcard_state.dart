part of 'add_flashcard_bloc.dart';

@freezed
class AddFlashcardState with _$AddFlashcardState {
  const AddFlashcardState._();

  const factory AddFlashcardState({
    required String sourceLocale,
    required String destLocale,
    required String searchText,
    @Default(ApiTranslator.deepl) ApiTranslator translatorApi,
    @Default([]) List<ApiTranslator> possibleTranslatorApis,
    @Default(true) bool isReversable,
    @Default(false) bool isSubmitting,
  }) = _AddFlashcardState;

  factory AddFlashcardState.fromJson(Map<String, Object?> json) =>
      _$AddFlashcardStateFromJson(json);
}
