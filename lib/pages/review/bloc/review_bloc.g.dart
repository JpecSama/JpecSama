// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewStateImpl _$$ReviewStateImplFromJson(Map<String, dynamic> json) =>
    _$ReviewStateImpl(
      submissionError: json['submission_error'] as String?,
      isInitialising: json['is_initialising'] as bool? ?? false,
      isSubmitting: json['is_submitting'] as bool? ?? false,
      isSessionEnded: json['is_session_ended'] as bool? ?? false,
      hasReviewError: json['has_review_error'] as bool? ?? false,
      isHintVisible: json['is_hint_visible'] as bool? ?? false,
      isAnswerVisible: json['is_answer_visible'] as bool? ?? false,
      currentCardIndex: (json['current_card_index'] as num?)?.toInt() ?? 0,
      flashcards: (json['flashcards'] as List<dynamic>)
          .map((e) => Flashcard.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionAnswers: (json['session_answers'] as List<dynamic>)
          .map(
              (e) => FlashcardSessionAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReviewStateImplToJson(_$ReviewStateImpl instance) =>
    <String, dynamic>{
      'submission_error': instance.submissionError,
      'is_initialising': instance.isInitialising,
      'is_submitting': instance.isSubmitting,
      'is_session_ended': instance.isSessionEnded,
      'has_review_error': instance.hasReviewError,
      'is_hint_visible': instance.isHintVisible,
      'is_answer_visible': instance.isAnswerVisible,
      'current_card_index': instance.currentCardIndex,
      'flashcards': instance.flashcards.map((e) => e.toJson()).toList(),
      'session_answers':
          instance.sessionAnswers.map((e) => e.toJson()).toList(),
    };
