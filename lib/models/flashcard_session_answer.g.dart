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
      flashCardAnswer: json['flash_card_answer'] == null
          ? null
          : FlashcardAnswer.fromJson(
              json['flash_card_answer'] as Map<String, dynamic>),
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$FlashcardSessionAnswerImplToJson(
        _$FlashcardSessionAnswerImpl instance) =>
    <String, dynamic>{
      'given_answer': instance.givenAnswer,
      'flash_card': instance.flashCard.toJson(),
      'flash_card_answer': instance.flashCardAnswer?.toJson(),
      'is_correct': instance.isCorrect,
    };
