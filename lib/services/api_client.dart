import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  late Dio dio;

  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGQxY2IwOGI3YjU3ODgyYWRhYTczMWZiMWJkNmI5ZiIsIm5iZiI6MTc1NzE0NjY5NS45NjgsInN1YiI6IjY4YmJlZTQ3ZjRmYzc0NGU1MTk4YjU2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dCQQdo20p9eWcBEjkp6dOWmmSpKtqJPBvZ-QV1-Wtek';

  ApiClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $apiKey'},
    );
    dio = Dio(options);
    // ✅ Add interceptors for logging, error handling, and headers
    dio.interceptors.add(
      PrettyDioLogger(requestBody: true, responseBody: true),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add API key as query parameter (required by TMDB)
          options.queryParameters['api_key'] = apiKey;
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          // Centralized error handling
          _handleError(e);
          return handler.next(e);
        },
      ),
    );
  }

  void _handleError(DioException e) {
    String message = 'Something went wrong';
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timed out';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Server not responding';
        break;
      case DioExceptionType.badResponse:
        message = 'Invalid response: ${e.response?.statusCode}';
        break;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      default:
        message = e.message ?? 'Unknown error';
    }
    log("❌ API Error: $message");
  }
}
