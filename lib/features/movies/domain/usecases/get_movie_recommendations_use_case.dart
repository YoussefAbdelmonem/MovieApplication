import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/core/usecase/base_usecase.dart';
import 'package:movies_application/features/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List <Recommendations>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List <Recommendations>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies( parameters);
  }

}


class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];

}