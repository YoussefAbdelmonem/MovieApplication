
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';

import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';


part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsController extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsController(this.getMovieDetailsUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase ;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {

   final result= await getMovieDetailsUseCase(MovieDetailParameters(movieId: event.id));


   result.fold((l) => emit(state.copyWith(
     movieDetailsMessage: l.message,
     movieDetailsState: RequestState.error,

   )), (r) => emit(state.copyWith(
     movieDetailsState: RequestState.loaded,
     movieDetails: r
   ),),);
  }


}
