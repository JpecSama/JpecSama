import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/api/deepl_translation.dart';
import 'package:jpec_sama/models/api/jisho/jisho_translation.dart';

part 'api_translation.g.dart';
part 'api_translation.freezed.dart';

//https://developers.deepl.com/docs/api-reference/translate
@freezed
class ApiTranslation with _$ApiTranslation {
  const factory ApiTranslation({
    required String text,
    String? hint,
  }) = _ApiTranslation;

  factory ApiTranslation.fromJson(Map<String, Object?> json) =>
      _$ApiTranslationFromJson(json);

  factory ApiTranslation.fromDeepl(DeeplTranslation translation) =>
      ApiTranslation(text: translation.text);

  factory ApiTranslation.fromJisho(JishoTranslation translation,
          {String destLocale = 'EN'}) =>
      ApiTranslation(
        text: destLocale == 'EN'
            ? (translation.senses.firstOrNull?.englishDefinitions.firstOrNull ??
                '')
            : (translation.japanese?.firstOrNull?.word ??
                translation.japanese?.firstOrNull?.reading ??
                ''),
        hint: destLocale == 'EN' &&
                translation.japanese?.firstOrNull?.word == null
            ? translation.japanese?.firstOrNull?.reading
            : null,
      );
}
