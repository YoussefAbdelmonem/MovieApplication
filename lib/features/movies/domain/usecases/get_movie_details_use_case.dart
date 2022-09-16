import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/core/usecase/base_usecase.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailParameters>
{
 final BaseMoviesRepository baseMoviesRepository ;

  GetMovieDetailsUseCase(  this.baseMoviesRepository);


  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailParameters parameters) async{

  return await baseMoviesRepository.getDetailsMovies(parameters);
  }


}
class MovieDetailParameters extends Equatable
{
 final int movieId;

  const MovieDetailParameters({required this.movieId});
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}