import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    String? releaseDate,
    double? voteAverage,
    List<int>? genreIds,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      genreIds: genreIds ?? this.genreIds,
    );
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, releaseDate: $releaseDate, voteAverage: $voteAverage, genreIds: $genreIds)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage &&
        listEquals(other.genreIds, genreIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        voteAverage.hashCode ^
        genreIds.hashCode;
  }
}
