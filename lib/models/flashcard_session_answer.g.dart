// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_session_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardSessionAnswerImpl _$$FlashcardSessionAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$FlashcardSessionAnswerImpl(
      givenAnswer: json['given_answer'] as String,
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$FlashcardSessionAnswerImplToJson(
        _$FlashcardSessionAnswerImpl instance) =>
    <String, dynamic>{
      'given_answer': instance.givenAnswer,
      'is_correct': instance.isCorrect,
    };
