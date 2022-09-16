import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/core/usecase/base_usecase.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository ;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getTopRatedMovies();
  }




}