import 'package:flutter/widgets.dart';
import 'package:jpec_sama/services/supabase/supabase_service.dart';

class UserCredRepository {
  Future<void> setDeeplApiKey(String userId, String apiKey) async {
    await supabase.from('user_cred').upsert(
        {'user_id': userId, 'deepl_api_key': apiKey},
        onConflict: 'user_id').eq('user_id', userId);
  }

  Future<String?> getDeeplApiKey(String userId) async {
    try {
      final res = await supabase
          .from('user_cred')
          .select(
            'deepl_api_key',
          )
          .eq('user_id', userId)
          .maybeSingle();
      return res != null && res.keys.contains('deepl_api_key')
          ? res['deepl_api_key']
          : null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
