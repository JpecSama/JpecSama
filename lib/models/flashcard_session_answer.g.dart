// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_session_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardSessionAnswerImpl _$$FlashcardSessionAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$FlashcardSessionAnswerImpl(
      givenAnswer: json['given_answer'] as String,
      flashCard: Flashcard.fromJson(json['flash_card'] as Map<String, dynamic>),
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$FlashcardSessionAnswerImplToJson(
        _$FlashcardSessionAnswerImpl instance) =>
    <String, dynamic>{
      'given_answer': instance.givenAnswer,
      'flash_card': instance.flashCard.toJson(),
      'is_correct': instance.isCorrect,
    };
