import 'package:dio/dio.dart';

final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
final String baseUrl = 'https://api.themoviedb.org/3';
final String apiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGQxY2IwOGI3YjU3ODgyYWRhYTczMWZiMWJkNmI5ZiIsIm5iZiI6MTc1NzE0NjY5NS45NjgsInN1YiI6IjY4YmJlZTQ3ZjRmYzc0NGU1MTk4YjU2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dCQQdo20p9eWcBEjkp6dOWmmSpKtqJPBvZ-QV1-Wtek';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    queryParameters: {'api_key': apiKey, 'language': 'en-US'},
  ),
);
