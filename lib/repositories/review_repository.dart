import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/services/review_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/flashcard_session_answer.dart';

class ReviewRepository {
  Future<bool> createFlashcard(
    String userId,
    Flashcard flashcard,
    Iterable<String> answers,
    bool isReversable,
  ) async {
    final res = await supabase
        .from('flashcard')
        .insert(flashcard.copyWith(userId: userId).toInsertJson())
        .select('id')
        .single();

    final flashcardId = res['id'];

    await supabase.from('flashcard_answer').insert(answers.map((answer) {
          return {
            'flashcard_id': flashcardId,
            'answer': answer,
          };
        }).toList());

    if (isReversable) {
      return await createFlashcard(
        userId,
        flashcard.copyWith(flashcardText: answers.first, hint: null),
        [flashcard.flashcardText],
        false,
      );
    }
    return flashcardId != null;
  }

  Future<List<Flashcard>> getCardsToReviewCountPerHour() async {
    DateTime date = DateTime.now();
    date = date.subtract(Duration(
      minutes: date.minute,
      seconds: date.second,
      microseconds: date.microsecond,
      milliseconds: date.millisecond,
    ));
    var res = await supabase
        .from('flashcard')
        .select('*')
        // .gte(
        //   'next_available_at',
        //   date.toIso8601String(),
        // )
        .lte(
          'next_available_at',
          date.add(const Duration(days: 1)).toIso8601String(),
        );
    return res.map((el) => Flashcard.fromJson(el)).toList();
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
          i,
        );
      }
      if (incorrectLevelMap[i]!.isNotEmpty) {
        await updateForGivenLevel(
            incorrectLevelMap[i]!.map((entry) => entry.flashCard.id!).toList(),
            i);
      }
    }

    List<String> answerIds = answers
        .map((answer) => answer.flashCardAnswer?.id)
        .where(
          (element) => element != null,
        )
        .toList() as List<String>;

    await updateLastUsedAnswers(
      answerIds,
    );
  }

  Future<void> updateLastUsedAnswers(List<String> ids) async {
    await supabase
        .from('flashcard_answer')
        .update({
          'last_used_at': DateTime.now().toIso8601String(),
        })
        .inFilter('id', ids)
        .select('*');
  }

  Future<void> updateForGivenLevel(List<String> ids, int level) async {
    final service = ReviewService();
    DateTime date =
        DateTime.now().add(service.getDurationAccordingToLevel(level));
    String dateStr = date
        .subtract(Duration(
          minutes: date.minute,
          seconds: date.second,
          microseconds: date.microsecond,
          milliseconds: date.millisecond,
        ))
        .toIso8601String();

    List<Map<String, dynamic>> updatedCards = await supabase
        .from('flashcard')
        .update({
          'level': level,
          'next_available_at': dateStr,
        })
        .inFilter('id', ids)
        .select('*');
    print(updatedCards);
  }
}
