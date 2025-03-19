import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseService {
  static Future<void> handlingException(
      Object e, StackTrace? stackTrace) async {
    debugPrint('Error during query: $e');
    if (!kDebugMode) {
      Sentry.captureException(e, stackTrace: stackTrace);
    }
  }

  /// A generic static method for executing Supabase queries safely.
  static Future<T?> safeSingleQuery<T>(
    Future<dynamic> Function() queryFunction,
    T Function(dynamic)? fromJson,
  ) async {
    try {
      final dynamic res = await queryFunction();

      if (fromJson != null) {
        return fromJson(res);
      }

      return res as T?;
    } catch (e, stackTrace) {
      handlingException(e, stackTrace);
      return null;
    }
  }

  static Future<List<T>?> safeListQuery<T>(
    Future<dynamic> Function() queryFunction,
    T Function(dynamic)? fromJson,
  ) async {
    try {
      final dynamic res = await queryFunction();

      if (fromJson != null) {
        return (res as List<dynamic>).map((e) => fromJson(e)).toList();
      }

      return res as List<T>?;
    } catch (e, stackTrace) {
      handlingException(e, stackTrace);
      return null;
    }
  }
}
