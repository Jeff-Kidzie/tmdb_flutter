import 'package:tmdb_flutter/data/movie_response.dart';
import 'package:tmdb_flutter/data/movies.dart';
import 'package:tmdb_flutter/services/api_services.dart';

class MovieRepository {
  
  Future<List<Movie>> callMovieList() async {
    var response = await ApiService().getRequest("/movie/now_playing");
    var movieResponse = MovieResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return movieResponse.results;
  }
}
