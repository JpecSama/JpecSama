import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/api/deepl_translation.dart';

part 'api_translation.g.dart';
part 'api_translation.freezed.dart';

//https://developers.deepl.com/docs/api-reference/translate
@freezed
class ApiTranslation with _$ApiTranslation {
  const factory ApiTranslation({
    required String text,
  }) = _ApiTranslation;

  factory ApiTranslation.fromJson(Map<String, Object?> json) =>
      _$ApiTranslationFromJson(json);

  factory ApiTranslation.fromDeepl(DeeplTranslation translation) =>
      ApiTranslation(text: translation.text);
}
