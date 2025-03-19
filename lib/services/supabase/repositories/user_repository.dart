import 'package:jpec_sama/services/supabase/supabase_service.dart';

class UserRepository {
  static Future<void> resetPassword(String email) async {
    await supabase.auth.resetPasswordForEmail(email.trim());
  }

  static String? getCurrentUserId() {
    return supabase.auth.currentUser?.id;
  }
}
