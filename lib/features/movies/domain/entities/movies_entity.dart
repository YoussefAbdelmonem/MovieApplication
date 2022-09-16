import 'package:equatable/equatable.dart';

class Movies extends Equatable
{
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final String voteAverage;
  final List<int> genreIds;

 const Movies(
      {
        required this.id,
        required this.backdropPath,
        required  this.title,
        required  this.releaseDate,
        required this.overview,
        required this.voteAverage,
        required this.genreIds}
        );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        genreIds,
        releaseDate,

      ];




}