part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendations = const [],
    this.movieRecommendationsMessage = '',
    this.movieRecommendationsState = RequestState.loading,


  });

  final MovieDetails ?movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendations>movieRecommendations;

  final RequestState movieRecommendationsState;

  final String movieRecommendationsMessage;


  MovieDetailsState copyWith({ MovieDetails ?movieDetails,
    RequestState? movieDetailsState,
    String ?movieDetailsMessage,
    List<Recommendations> ?movieRecommendations,
    String ?movieRecommendationsMessage,
    RequestState ?movieRecommendationsState


  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsMessage: movieRecommendationsMessage ??
          this.movieRecommendationsMessage,
      movieRecommendationsState: movieRecommendationsState ??
          this.movieRecommendationsState,


    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendations,
        movieRecommendationsState,
        movieRecommendationsMessage,
      ];


}
