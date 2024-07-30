import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';

part 'flashcard_session_answer.g.dart';
part 'flashcard_session_answer.freezed.dart';

@freezed
class FlashcardSessionAnswer with _$FlashcardSessionAnswer {
  const factory FlashcardSessionAnswer({
    required String givenAnswer,
    required Flashcard flashCard,
    FlashcardAnswer? flashCardAnswer,
    required bool isCorrect,
  }) = _FlashcardSessionAnswer;

  factory FlashcardSessionAnswer.fromJson(Map<String, Object?> json) =>
      _$FlashcardSessionAnswerFromJson(json);
}
