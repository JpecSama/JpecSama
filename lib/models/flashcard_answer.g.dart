// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardAnswerImpl _$$FlashcardAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$FlashcardAnswerImpl(
      id: json['id'] as String,
      answer: json['answer'] as String,
      lastUsedAt: json['last_used_at'] == null
          ? null
          : DateTime.parse(json['last_used_at'] as String),
    );

Map<String, dynamic> _$$FlashcardAnswerImplToJson(
        _$FlashcardAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'last_used_at': instance.lastUsedAt?.toIso8601String(),
    };
