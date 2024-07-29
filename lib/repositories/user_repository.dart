import '../main.dart';

class UserRepository {
  Future<void> setDeeplApiKey(String userId, String apiKey) async {
    await supabase.from('user_cred').upsert(
        {'user_id': userId, 'deepl_api_key': apiKey},
        onConflict: 'user_id').eq('user_id', userId);
  }

  static String? getCurrentUserId() {
    return supabase.auth.currentUser?.id;
  }
}
