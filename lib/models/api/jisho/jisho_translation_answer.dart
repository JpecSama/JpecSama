import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/api/jisho/jisho_translation.dart';

part 'jisho_translation_answer.g.dart';
part 'jisho_translation_answer.freezed.dart';

@freezed
class JishoTranslationAnswer with _$JishoTranslationAnswer {
  const factory JishoTranslationAnswer({
    required List<JishoTranslation> data,
  }) = _JishoTranslationAnswer;

  factory JishoTranslationAnswer.fromJson(Map<String, Object?> json) =>
      _$JishoTranslationAnswerFromJson(json);
}
