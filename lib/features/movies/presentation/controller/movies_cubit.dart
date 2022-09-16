import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_application/core/services/services_locator.dart';
import 'package:movies_application/core/usecase/base_usecase.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movies_application/features/movies/presentation/controller/moives_event.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_state.dart';

class MoviesController extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesController(this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingEvent);
    on<GetPopularMoviesEvent>(_getPopularEvent);

    on<GetTopRatedMoviesEvent>(_getTopRatedEvent);
  }

  FutureOr<void> _getNowPlayingEvent(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getNowPlayingMoviesUseCase(NoParameters());
    print(getIt<GetNowPlayingMoviesUseCase>().hashCode);

    print(result);
    result.fold(
            (l) => emit(state.copyWith(
            nowPlyingState: RequestState.error,
            nowPlayingMessage: l.message)),
            (r) => emit(state.copyWith(
          nowPlyingState: RequestState.loaded,
          nowPlayingMovies: r,
        )));
  }

  FutureOr<void> _getTopRatedEvent(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result =await getTopRatedMoviesUseCase(NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        )));
  }

  FutureOr<void> _getPopularEvent(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase(NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
            (r) => emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        )));
  }
}
