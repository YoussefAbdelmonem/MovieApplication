import 'package:equatable/equatable.dart';
import 'package:movies_application/features/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;

  final int id;
  final int runtime;
  final String overview;
  final String title;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails(
      {required this.backdropPath,
      required this.genres,
      required this.id,
      required this.runtime,
      required this.overview,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        runtime,
        overview,
        title,
        voteAverage,
        releaseDate
      ];
}
