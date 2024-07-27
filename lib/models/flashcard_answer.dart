import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_answer.g.dart';
part 'flashcard_answer.freezed.dart';

@freezed
class FlashcardAnswer with _$FlashcardAnswer {
  const factory FlashcardAnswer({
    required String id,
    required String answer,
    DateTime? lastUsedAt,
  }) = _FlashcardAnswer;

  factory FlashcardAnswer.fromJson(Map<String, Object?> json) =>
      _$FlashcardAnswerFromJson(json);
}
