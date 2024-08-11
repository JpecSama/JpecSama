// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jisho_translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JishoTranslationImpl _$$JishoTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$JishoTranslationImpl(
      slug: json['slug'] as String,
      isCommon: json['is_common'] as bool,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      jlpt: (json['jlpt'] as List<dynamic>?)?.map((e) => e as String).toList(),
      japanese: (json['japanese'] as List<dynamic>?)
          ?.map((e) => JishoJapanese.fromJson(e as Map<String, dynamic>))
          .toList(),
      senses: (json['senses'] as List<dynamic>)
          .map((e) => JishoSense.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JishoTranslationImplToJson(
        _$JishoTranslationImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'is_common': instance.isCommon,
      'tags': instance.tags,
      'jlpt': instance.jlpt,
      'japanese': instance.japanese?.map((e) => e.toJson()).toList(),
      'senses': instance.senses.map((e) => e.toJson()).toList(),
    };
