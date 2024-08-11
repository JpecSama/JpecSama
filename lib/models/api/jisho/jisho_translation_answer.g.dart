// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jisho_translation_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JishoTranslationAnswerImpl _$$JishoTranslationAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$JishoTranslationAnswerImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => JishoTranslation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JishoTranslationAnswerImplToJson(
        _$JishoTranslationAnswerImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
