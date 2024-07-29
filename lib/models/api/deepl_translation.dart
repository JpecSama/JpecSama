import 'package:freezed_annotation/freezed_annotation.dart';

part 'deepl_translation.g.dart';
part 'deepl_translation.freezed.dart';

//https://developers.deepl.com/docs/api-reference/translate
@freezed
class DeeplTranslation with _$DeeplTranslation {
  const factory DeeplTranslation({
    required String text,
    String? detectedSourceLanguage,
  }) = _DeeplTranslation;

  factory DeeplTranslation.fromJson(Map<String, Object?> json) =>
      _$DeeplTranslationFromJson(json);
}
