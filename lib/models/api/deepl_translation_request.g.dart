// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deepl_translation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplTranslationRequestImpl _$$DeeplTranslationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplTranslationRequestImpl(
      text: (json['text'] as List<dynamic>).map((e) => e as String).toList(),
      targetLang: json['target_lang'] as String,
      sourceLang: json['source_lang'] as String?,
    );

Map<String, dynamic> _$$DeeplTranslationRequestImplToJson(
        _$DeeplTranslationRequestImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'target_lang': instance.targetLang,
      'source_lang': instance.sourceLang,
    };
