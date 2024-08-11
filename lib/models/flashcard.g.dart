// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardImpl _$$FlashcardImplFromJson(Map<String, dynamic> json) =>
    _$FlashcardImpl(
      id: json['id'] as String?,
      level: (json['level'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      nextAvailableAt: DateTime.parse(json['next_available_at'] as String),
      type: json['type'] as String? ?? 'vocabulary',
      flashcardText: json['flashcard_text'] as String,
      hint: json['hint'] as String?,
      answerInfos: json['answer_infos'] as String?,
      sourceLanguage: json['source_language'] as String?,
      destLanguage: json['dest_language'] as String?,
      userId: json['user_id'] as String?,
      flashcardAnswer: (json['flashcard_answer'] as List<dynamic>?)
              ?.map((e) => FlashcardAnswer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FlashcardImplToJson(_$FlashcardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'created_at': instance.createdAt?.toIso8601String(),
      'next_available_at': instance.nextAvailableAt.toIso8601String(),
      'type': instance.type,
      'flashcard_text': instance.flashcardText,
      'hint': instance.hint,
      'answer_infos': instance.answerInfos,
      'source_language': instance.sourceLanguage,
      'dest_language': instance.destLanguage,
      'user_id': instance.userId,
      'flashcard_answer':
          instance.flashcardAnswer.map((e) => e.toJson()).toList(),
    };
