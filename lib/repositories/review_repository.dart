import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/services/review_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/flashcard_session_answer.dart';
import '../services/notification_service.dart';

class ReviewRepository {
  Future<bool> updateFlashcard(Flashcard flashcard,
      {Iterable<String>? answers}) async {
    try {
      await supabase
          .from('flashcard')
          .update(flashcard.toInsertJson())
          .eq('id', flashcard.id!);
    } catch (e) {
      print(e);
      return false;
    }

    if (answers != null) {
      await deleteFlashcardAnswers(flashcard.id!);
      await createFlashcardAnswers(flashcard.id!, answers);
    }
    return true;
  }

  Future<String?> addFlashcardAnswer(String flashcardId, String answer) async {
    try {
      return (await supabase
          .from('flashcard_answer')
          .upsert({
            'flashcard_id': flashcardId,
            'answer': answer,
          })
          .select('id')
          .single())['id'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> deleteFlashcardAnswers(String flashcardId) async {
    await supabase
        .from('flashcard_answer')
        .delete()
        .eq('flashcard_id', flashcardId);
  }

  Future<void> createFlashcardAnswers(
      String flashcardId, Iterable<String> answers) async {
    await supabase.from('flashcard_answer').insert(answers.map((answer) {
          return {
            'flashcard_id': flashcardId,
            'answer': answer,
          };
        }).toList());
  }

  Future<bool> createFlashcard(
    String userId,
    Flashcard flashcard,
    Iterable<String> answers,
    bool isReversable,
  ) async {
    print('createFlashcard');
    print(flashcard.toJson());
    final res = await supabase
        .from('flashcard')
        .insert(flashcard
            .copyWith(
              userId: userId,
            )
            .toInsertJson())
        .select('id')
        .single();

    final flashcardId = res['id'];

    await createFlashcardAnswers(flashcardId, answers);

    if (isReversable) {
      String text = answers.first;
      final regExp = RegExp(r'(\([^)]+\))');
      RegExpMatch? hintMatch = regExp.firstMatch(text);
      String? hint = hintMatch?[0];
      text =
          hintMatch != null ? text.substring(0, hintMatch.start).trim() : text;

      return await createFlashcard(
        userId,
        flashcard.copyWith(
          flashcardText: text,
          hint: hint,
          sourceLanguage: flashcard.destLanguage,
          destLanguage: flashcard.sourceLanguage,
        ),
        [flashcard.flashcardText, flashcard.hint].nonNulls.toList(),
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
    var res = await supabase.from('flashcard').select('*').lte(
          'next_available_at',
          date.add(const Duration(days: 1)).toIso8601String(),
        );
    return res.map((el) => Flashcard.fromJson(el)).toList();
  }

  PostgrestTransformBuilder<List<Map<String, dynamic>>>? getCardsToReviewQuery(
      {int? maxCount}) {
    String? userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return null;
    }
    var query = supabase
        .from('flashcard')
        .select('*,flashcard_answer(*)')
        .lte(
          'next_available_at',
          DateTime.now(),
        )
        .eq('user_id', userId);
    if (maxCount == null) {
      return query;
    }
    return query.limit(maxCount);
  }

  Future<void> deleteCard(String cardId) async {
    return await supabase.from('flashcard').delete().eq(
          'id',
          cardId,
        );
  }

  Future<List<Flashcard>> getCardsToReview(int maxCount) async {
    final jsonCards = await getCardsToReviewQuery(
      maxCount: maxCount,
    );

    final cards =
        (jsonCards?.map((card) => Flashcard.fromJson(card)).toList() ?? []);
    cards.sort((a, b) =>
        (['JA'].contains(a.destLanguage) ? 1 : 0) -
        (['JA'].contains(b.destLanguage) ? 1 : 0));
    return cards;
  }

  Future<List<Flashcard>> getAllCards(
      {int page = 0,
      int limit = 100,
      required String sourceLocale,
      required String destLocale,
      String? searchText}) async {
    print("searchText $searchText");
    if (searchText != null && searchText.isNotEmpty) {
      return (await supabase
              .from('flashcard')
              .select('*,flashcard_answer(*)')
              .textSearch('flashcard_text', searchText)
              .eq('source_language', sourceLocale.toUpperCase())
              .eq('dest_language', destLocale.toUpperCase())
              .range(page * limit, (page + 1) * limit))
          .map((card) => Flashcard.fromJson(card))
          .toList();
    } else {
      return (await supabase
              .from('flashcard')
              .select('*,flashcard_answer(*)')
              .eq('source_language', sourceLocale.toUpperCase())
              .eq('dest_language', destLocale.toUpperCase())
              .range(page * limit, (page + 1) * limit))
          .map((card) => Flashcard.fromJson(card))
          .toList();
    }
  }

  Future<int> getCardsToReviewCount() async {
    return (await getCardsToReviewQuery()?.count())?.count ?? 0;
  }

  Future<void> postReview(List<FlashcardSessionAnswer> answers) async {
    Map<int, List<FlashcardSessionAnswer>> correctLevelMap = {};
    Map<int, List<FlashcardSessionAnswer>> incorrectLevelMap = {};
    for (int i = 0; i <= ReviewService.maxLevel; i++) {
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

    for (var i = 0; i <= ReviewService.maxLevel; i++) {
      if (correctLevelMap[i]?.isNotEmpty ?? false) {
        await updateForGivenLevel(
          correctLevelMap[i]!.map((entry) => entry.flashCard.id!).toList(),
          i,
        );
      }
      if (incorrectLevelMap[i]?.isNotEmpty ?? false) {
        await updateForGivenLevel(
            incorrectLevelMap[i]!.map((entry) => entry.flashCard.id!).toList(),
            i);
      }
    }

    List<String> answerIds = answers
        .map((answer) => answer.flashCardAnswer?.id)
        .whereType<String>()
        .toList();

    await updateLastUsedAnswers(
      answerIds,
    );

    NotificationService.createReviewNotification();
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
