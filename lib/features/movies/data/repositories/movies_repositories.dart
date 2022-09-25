import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/exception.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/features/movies/data/datasources/movie_reomte_data_source.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';


class MoviesRepositories extends BaseMoviesRepository
{
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepositories(this.remoteDataSource);


  @override
  Future<Either<Failure ,List<Movies>> > getNowPlayingMovies()async {
   final result= await remoteDataSource.getNowPlayingMovies();
   try
   {
     return Right(result);

   } on ServerException catch(failure)
   {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }



  @override
  Future<Either<Failure, MovieDetails>> getDetailsMovies(MovieDetailParameters parameters)async {
    final result= await remoteDataSource.getMoviesDetails(parameters);
    try
    {
      return Right(result);

    } on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }




    }