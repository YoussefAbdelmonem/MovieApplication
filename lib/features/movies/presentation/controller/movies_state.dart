
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';

 class MoviesState extends Equatable {
   ///NOW PLAYING MOVIES
  final List<Movies> nowPlayingMovies ;
  final RequestState nowPlyingState;
  final String nowPlayingMessage;
   const MoviesState({
     ///NOW PLAYING MOVIES
      this.nowPlayingMovies=const[],
      this.nowPlyingState=RequestState.loading,
      this.nowPlayingMessage='',
   }
   );

  @override
  List<Object> get props => [
    ///NOW PLAYING MOVIES
    nowPlayingMovies,
    nowPlayingMessage,
    nowPlyingState,
  ];
}

