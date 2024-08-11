import 'package:dio/dio.dart';

import '../models/api/jisho/jisho_translation_answer.dart';

class JishoService {
  final Dio _dio;

  // https://jisho.org/api/v1/search/words?keyword=%E5%A4%A7%E7%B5%B1%E9%A0%98

  JishoService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://jisho.org/api/v1',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<JishoTranslationAnswer> translate(String word) async {
    try {
      final response = await _dio.get(
        '/search/words?keyword=$word',
      );
      print(response.data);
      return JishoTranslationAnswer.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
