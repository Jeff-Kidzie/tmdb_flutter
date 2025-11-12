import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'genreIds': genreIds,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      overview: map['overview'] as String,
      posterPath: map['posterPath'] as String,
      releaseDate: map['releaseDate'] as String,
      voteAverage: map['voteAverage'] as double,
      genreIds: List<int>.from((map['genreIds'] as List<int>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, releaseDate: $releaseDate, voteAverage: $voteAverage, genreIds: $genreIds)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
