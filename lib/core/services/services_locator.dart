import 'package:get_it/get_it.dart';
import 'package:movies_application/features/movies/data/datasources/movie_reomte_data_source.dart';
import 'package:movies_application/features/movies/data/repositories/movies_repositories.dart';
import 'package:movies_application/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_application/features/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_cubit.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator
{
  void init()
  {
    ///BLOC new object each build of the BLOC <MOVIE SCREEN>
    serviceLocator.registerFactory(() => MoviesController(serviceLocator()));
    serviceLocator.registerFactory(() => MovieDetailsController(serviceLocator()));
    /// Repository......... single build each time
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepositories(serviceLocator()));

    /// DATA SOURCE
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

     /// USE CASES
    serviceLocator.registerLazySingleton(() => GetNowPlayingMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));


  }
}