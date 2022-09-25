import 'package:equatable/equatable.dart';

class Movies extends Equatable
{
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final String voteAverage;


 const Movies(
      {
        required this.id,
        required this.backdropPath,
        required  this.title,
        required  this.releaseDate,
        required this.overview,
        required this.voteAverage,
        }
        );

  @override
  List<Object?> get props =>
      [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        releaseDate,

      ];




}