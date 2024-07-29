import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';

part 'flashcard.g.dart';
part 'flashcard.freezed.dart';

@freezed
class Flashcard with _$Flashcard {
  const factory Flashcard({
    String? id,
    @Default('vocabulary') String type,
    @Default(0) int level,
    DateTime? createdAt,
    DateTime? nextAvailableAt,
    required String flashcardText,
    String? hint,
    String? answerInfos,
    String? sourceLanguage,
    String? destLanguage,
    @Default([]) List<FlashcardAnswer> flashcardAnswer,
  }) = _Flashcard;

  factory Flashcard.fromJson(Map<String, Object?> json) =>
      _$FlashcardFromJson(json);
}
