//https://api.deepl.com/v2/translate

import 'package:dio/dio.dart';
import 'package:jpec_sama/models/api/deepl_translation_answer.dart';
import 'package:jpec_sama/models/api/deepl_translation_request.dart';

class DeeplService {
  final Dio _dio;

  DeeplService(String authKey)
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api-free.deepl.com/v2',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          headers: {
            'Authorization': 'DeepL-Auth-Key $authKey',
            'Content-Type': 'application/json',
          },
        ));

  Future<DeeplTranslationAnswer> translate(
      DeeplTranslationRequest request) async {
    final data = request.toJson();
    print(data);
    try {
      final response = await _dio.post(
        '/translate',
        data: data,
      );
      return DeeplTranslationAnswer.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
