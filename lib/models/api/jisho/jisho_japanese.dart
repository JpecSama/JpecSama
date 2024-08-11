import 'package:freezed_annotation/freezed_annotation.dart';

part 'jisho_japanese.g.dart';
part 'jisho_japanese.freezed.dart';

@freezed
class JishoJapanese with _$JishoJapanese {
  const factory JishoJapanese({
    String? word,
    String? reading,
  }) = _JishoJapanese;

  factory JishoJapanese.fromJson(Map<String, Object?> json) =>
      _$JishoJapaneseFromJson(json);
}
