import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_recommendations_use_case.dart';



abstract class BaseMoviesRepository
{
  Future<Either<Failure ,List<Movies>> > getNowPlayingMovies();

  Future<Either<Failure ,List<Movies>> > getTopRatedMovies();

  Future<Either<Failure ,List<Movies>> > getPopularMovies();

  Future<Either<Failure ,MovieDetails >> getDetailsMovies(MovieDetailParameters parameters);

  Future<Either<Failure ,List <Recommendations> >> getRecommendationMovies(RecommendationParameters parameters);
}