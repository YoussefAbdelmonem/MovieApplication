import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';

class MoviesModel extends Movies {
 const MoviesModel(
  {
  required super.id,
  required super.backdropPath,
  required super.title,
  required super.releaseDate,
  required super.overview,
  required super.voteAverage,
  required super.genreIds
  });


factory MoviesModel.fromJson(Map<String,dynamic>json)=>
MoviesModel(
  id: json["id"],
backdropPath: json["backdrop_path"],
title: json["title"],
releaseDate: json["release_date"],
overview: json["overview"],
voteAverage: json["vote_average"].toString()
, genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
);


}



