part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  final MovieDetails ?movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  MovieDetailsState copyWith({ MovieDetails ?movieDetails,
    RequestState? movieDetailsState,
    String ?movieDetailsMessage,



  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,

      ];


}
