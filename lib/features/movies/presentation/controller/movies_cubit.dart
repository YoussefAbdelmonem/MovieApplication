import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_application/core/services/services_locator.dart';
import 'package:movies_application/core/usecase/base_usecase.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';

import 'package:movies_application/features/movies/presentation/controller/moives_event.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_state.dart';

class MoviesController extends Bloc<MoviesEvent, MoviesState> {

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesController(this.getNowPlayingMoviesUseCase,) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingEvent);

  }

  FutureOr<void> _getNowPlayingEvent(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    print(serviceLocator<GetNowPlayingMoviesUseCase>().hashCode);

    print(result);
    result.fold(
            (l) => emit(MoviesState(
            nowPlyingState: RequestState.error,
            nowPlayingMessage: l.message)),
            (r) => emit(MoviesState(
          nowPlyingState: RequestState.loaded,
          nowPlayingMovies: r,
        )));
  }


}
