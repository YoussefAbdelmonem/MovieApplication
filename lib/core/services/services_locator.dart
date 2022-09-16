
import 'package:get_it/get_it.dart';
import 'package:movies_application/features/movies/data/datasources/movie_reomte_data_source.dart';
import 'package:movies_application/features/movies/data/repositories/movies_repositories.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_recommendations_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movies_application/features/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_cubit.dart';

final getIt = GetIt.instance;

class ServicesLocator
{
  void init()
  {
    ///BLOC
    getIt.registerFactory(() => MoviesController(getIt(),getIt(),getIt()));
    getIt.registerFactory(() => MovieDetailsController(getIt(),getIt()));

    /// Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepositories(getIt()));

    /// DATA SOURCE
     getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

     /// USE CASES
     getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
     getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
     getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
     getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
     getIt.registerLazySingleton(() => GetMovieRecommendationUseCase(getIt()));

  }
}