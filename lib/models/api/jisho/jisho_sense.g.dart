// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jisho_sense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JishoSenseImpl _$$JishoSenseImplFromJson(Map<String, dynamic> json) =>
    _$JishoSenseImpl(
      englishDefinitions: (json['english_definitions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      partsOfSpeech: (json['parts_of_speech'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      infos:
          (json['infos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$JishoSenseImplToJson(_$JishoSenseImpl instance) =>
    <String, dynamic>{
      'english_definitions': instance.englishDefinitions,
      'parts_of_speech': instance.partsOfSpeech,
      'tags': instance.tags,
      'infos': instance.infos,
    };
