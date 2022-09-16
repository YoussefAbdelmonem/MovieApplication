
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_recommendations_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsController extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsController(this.getMovieDetailsUseCase,this.getMovieRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase ;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

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

  FutureOr<void> _getRecommendation(GetMovieRecommendationsEvent event, Emitter<MovieDetailsState> emit)async {

    final result= await getMovieRecommendationUseCase(RecommendationParameters(event.id));


    result.fold((l) => emit(state.copyWith(
      movieRecommendationsMessage: l.message,
      movieRecommendationsState: RequestState.error,

    )), (r) => emit(state.copyWith(
        movieRecommendationsState: RequestState.loaded,
        movieRecommendations: r
    ),),);
  }
}
