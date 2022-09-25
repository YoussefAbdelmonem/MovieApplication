import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';




abstract class BaseMoviesRepository
{
  Future<Either<Failure ,List<Movies>> > getNowPlayingMovies();



  Future<Either<Failure ,MovieDetails >> getDetailsMovies(MovieDetailParameters parameters);


}