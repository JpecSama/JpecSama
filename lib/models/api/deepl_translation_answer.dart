import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/api/deepl_translation.dart';

part 'deepl_translation_answer.g.dart';
part 'deepl_translation_answer.freezed.dart';

//https://developers.deepl.com/docs/api-reference/translate
@freezed
class DeeplTranslationAnswer with _$DeeplTranslationAnswer {
  const DeeplTranslationAnswer._();

  @JsonSerializable(explicitToJson: true)
  const factory DeeplTranslationAnswer({
    // @JsonKey(toJson: DeeplTranslation.)
    required List<DeeplTranslation> translations,
  }) = _DeeplTranslationAnswer;

  factory DeeplTranslationAnswer.fromJson(Map<String, Object?> json) =>
      _$DeeplTranslationAnswerFromJson(json);
}
