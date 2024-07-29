// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deepl_translation_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplTranslationAnswerImpl _$$DeeplTranslationAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplTranslationAnswerImpl(
      translations: (json['translations'] as List<dynamic>)
          .map((e) => DeeplTranslation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DeeplTranslationAnswerImplToJson(
        _$DeeplTranslationAnswerImpl instance) =>
    <String, dynamic>{
      'translations': instance.translations.map((e) => e.toJson()).toList(),
    };
