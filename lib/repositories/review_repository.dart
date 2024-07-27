import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReviewRepository {
  static PostgrestTransformBuilder<List<Map<String, dynamic>>>
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

  static Future<List<Flashcard>> getCardsToReview() async {
    final cards = await getCardsToReviewQuery();
    print(cards);
    return cards.map((card) => Flashcard.fromJson(card)).toList();
  }

  static Future<int> getCardsToReviewCount() async {
    return (await getCardsToReviewQuery().count()).count;
    // return await getCardsToReviewQuery().count();
  }
}
