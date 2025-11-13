import 'dart:developer';

import 'package:get/get.dart';
import 'package:tmdb_flutter/repository/movie_repository.dart';

class HomeController extends GetxController with StateMixin<String> {
  final MovieRepository repository = MovieRepository();

  @override
  void onInit() {
    super.onInit();
    log("HomeController initialized");
    fetchNowPlaying();
  }

  fetchNowPlaying() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await repository.callMovieList();

      if (response.isNotEmpty) {
        log("response for first item : ${response[0].toString()}");
        String posterUrl =
            "https://image.tmdb.org/t/p/w500${response[0].posterPath}";
        log("Poster URL: $posterUrl");
        change(posterUrl, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("No movies found"));
      }
    } catch (e) {
      log("Error fetching movies: $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
