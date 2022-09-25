import 'dart:core';

import 'package:movies_application/features/movies/domain/entities/genres.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';

import 'geners_model.dart';

class MovieDetailModel extends MovieDetails {
    const MovieDetailModel(
    {required super.backdropPath,
    required super.genres,
    required super.id,
    required super.runtime,
    required super.overview,
    required super.title,
    required super.voteAverage,
    required super.releaseDate});

factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
return MovieDetailModel(
backdropPath: json["backdrop_path"] ,
genres: List<Genres>.from(
json["genres"].map((x) => MovieGenresModel.fromJson(x))),
id: json["id"],
runtime: json["runtime"],
overview: json["overview"],
title: json["title"],
voteAverage: json["vote_average"],
releaseDate: json["release_date"]);
}
}