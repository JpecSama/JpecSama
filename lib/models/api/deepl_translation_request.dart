import 'package:freezed_annotation/freezed_annotation.dart';

part 'deepl_translation_request.g.dart';
part 'deepl_translation_request.freezed.dart';

//https://developers.deepl.com/docs/api-reference/translate
@freezed
class DeeplTranslationRequest with _$DeeplTranslationRequest {
  const factory DeeplTranslationRequest({
    required List<String> text,
    required String targetLang,
    String? sourceLang,
  }) = _DeeplTranslationRequest;

  factory DeeplTranslationRequest.fromJson(Map<String, Object?> json) =>
      _$DeeplTranslationRequestFromJson(json);
}
