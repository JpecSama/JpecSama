import 'package:freezed_annotation/freezed_annotation.dart';

part 'jisho_sense.g.dart';
part 'jisho_sense.freezed.dart';

@freezed
class JishoSense with _$JishoSense {
  const factory JishoSense({
    required List<String> englishDefinitions,
    List<String>? partsOfSpeech,
    List<String>? tags,
    List<String>? infos,
//     "links": [],
// "restrictions": [],
// "see_also": [],
// "antonyms": [],
// "source": [],
// "info": []
  }) = _JishoSense;

  factory JishoSense.fromJson(Map<String, Object?> json) =>
      _$JishoSenseFromJson(json);
}
