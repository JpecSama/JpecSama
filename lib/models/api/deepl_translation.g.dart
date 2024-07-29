// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deepl_translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplTranslationImpl _$$DeeplTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplTranslationImpl(
      text: json['text'] as String,
      detectedSourceLanguage: json['detected_source_language'] as String?,
    );

Map<String, dynamic> _$$DeeplTranslationImplToJson(
        _$DeeplTranslationImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'detected_source_language': instance.detectedSourceLanguage,
    };
