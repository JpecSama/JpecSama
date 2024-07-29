import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/services/review_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/flashcard_session_answer.dart';

class ReviewRepository {
  Future<bool> createFlashcard(
      String userId, Flashcard flashcard, Iterable<String> answers) async {
    final res = await supabase
        .from('flashcard')
        .insert({
          'type': 'vocabulary',
          'flashcard_text': flashcard.flashcardText,
          'hint': flashcard.hint,
          'answer_infos': '',
          'source_language': flashcard.sourceLanguage,
          'dest_language': flashcard.destLanguage,
          'user_id': userId
        })
        .select('id')
        .single();

    final flashcardId = res['id'];
    for (var answer in answers) {
      await supabase.from('flashcard_answer').insert({
        'flashcard_id': flashcardId,
        'answer': answer,
      });
    }
    return flashcardId != null;
  }

  PostgrestTransformBuilder<List<Map<String, dynamic>>>
      getCardsToReviewQuery() {
    return supabase
        .from('flashcard')
        .select('*,flashcard_answer(*)')
        .lte(
          'next_available_at',
          DateTime.now(),
        )
        .limit(100);
  }

  Future<void> deleteCard(String cardId) async {
    return await supabase.from('flashcard').delete().eq(
          'id',
          cardId,
        );
  }

  Future<List<Flashcard>> getCardsToReview() async {
    final cards = await getCardsToReviewQuery();
    print(cards);
    return cards.map((card) => Flashcard.fromJson(card)).toList();
  }

  Future<List<Flashcard>> getAllCards({int page = 0, int limit = 100}) async {
    final cards = await supabase
        .from('flashcard')
        .select('*,flashcard_answer(*)')
        .range(page * limit, (page + 1) * limit);
    return cards.map((card) => Flashcard.fromJson(card)).toList();
  }

  Future<int> getCardsToReviewCount() async {
    return (await getCardsToReviewQuery().count()).count;
    // return await getCardsToReviewQuery().count();
  }

  Future<void> postReview(List<FlashcardSessionAnswer> answers) async {
    Map<int, List<FlashcardSessionAnswer>> correctLevelMap = {};
    Map<int, List<FlashcardSessionAnswer>> incorrectLevelMap = {};
    for (int i = 0; i < ReviewService.maxLevel; i++) {
      correctLevelMap[i] = [];
      incorrectLevelMap[i] = [];
    }
    for (final answer in answers) {
      if (answer.isCorrect) {
        correctLevelMap[answer.flashCard.level]!.add(answer);
      } else {
        incorrectLevelMap[answer.flashCard.level]!.add(answer);
      }
    }

    for (var i = 0; i < ReviewService.maxLevel; i++) {
      if (correctLevelMap[i]!.isNotEmpty) {
        await updateForGivenLevel(
            correctLevelMap[i]!.map((entry) => entry.flashCard.id!).toList(),
            i);
      }
      if (incorrectLevelMap[i]!.isNotEmpty) {
        await updateForGivenLevel(
            incorrectLevelMap[i]!.map((entry) => entry.flashCard.id!).toList(),
            i);
      }
    }
  }

  Future<void> updateForGivenLevel(List<String> ids, int level) async {
    final service = ReviewService();
    List<Map<String, dynamic>> updatedCards = await supabase
        .from('flashcard')
        .update({
          'level': level,
          'next_available_at': DateTime.now()
              .add(service.getDurationAccordingToLevel(level))
              .toIso8601String(),
        })
        .inFilter('id', ids)
        .select('*');
    print(updatedCards);
  }
}
