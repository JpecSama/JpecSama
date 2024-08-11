import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/api/jisho/jisho_japanese.dart';

import 'jisho_sense.dart';

part 'jisho_translation.g.dart';
part 'jisho_translation.freezed.dart';

@freezed
class JishoTranslation with _$JishoTranslation {
  const factory JishoTranslation({
    required String slug,
    required bool isCommon,
    List<String>? tags,
    List<String>? jlpt,
    List<JishoJapanese>? japanese,
    required List<JishoSense> senses,
  }) = _JishoTranslation;

  factory JishoTranslation.fromJson(Map<String, Object?> json) =>
      _$JishoTranslationFromJson(json);
}
