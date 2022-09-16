
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/entities/movies_entity.dart';

 class MoviesState extends Equatable {
   ///NOW PLAYING MOVIES
  final List<Movies> nowPlayingMovies ;
  final RequestState nowPlyingState;
  final String nowPlayingMessage;

///POPULAR MOVIES
  final List<Movies> popularMovies ;
  final RequestState popularState;
  final String  popularMessage;
  ///TOP RATED MOVIES
  final List<Movies> topRatedMovies ;
  final RequestState topRatedState;
  final String  topRatedMessage;

   const MoviesState({
     ///NOW PLAYING MOVIES
      this.nowPlayingMovies=const[],
      this.nowPlyingState=RequestState.loading,
      this.nowPlayingMessage='',

     ///POPULAR MOVIES
     this.popularMovies=const[],
     this.popularState=RequestState.loading,
     this.popularMessage='',
     ///TOP RATED MOVIES
     this.topRatedMovies=const[],
     this.topRatedState=RequestState.loading,
     this.topRatedMessage='',


   }
   );
   MoviesState copyWith(
  {
    ///NOW PLAYING MOVIES
     List<Movies>? nowPlayingMovies ,
     RequestState? nowPlyingState,
     String? nowPlayingMessage,

    ///POPULAR MOVIES
     List<Movies> ?popularMovies ,
     RequestState? popularState,
     String ? popularMessage,
    ///TOP RATED MOVIES
    List<Movies> ?topRatedMovies ,
    RequestState? topRatedState,
    String ? topRatedMessage,

 })
   {
     return MoviesState(
       ///NOW PLAYING MOVIES
       nowPlyingState: nowPlyingState?? this.nowPlyingState,
       nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
       nowPlayingMessage: nowPlayingMessage??this.nowPlayingMessage,
         ///POPULAR MOVIES
       popularState: popularState ?? this.popularState,
       popularMovies: popularMovies??this.popularMovies,
       popularMessage: popularMessage??this.popularMessage,
         /// TOP RATED MOVIES
       topRatedState: topRatedState?? this.topRatedState,
       topRatedMessage: topRatedMessage?? this.topRatedMessage,
       topRatedMovies: topRatedMovies?? this.topRatedMovies,



     );
   }
  @override
  List<Object> get props => [
    ///NOW PLAYING MOVIES
    nowPlayingMovies,
    nowPlayingMessage,
    nowPlyingState,
    ///POPULAR MOVIES
    popularMovies,
    popularState,
    popularMessage,
    ///TOP RATED MOVIES
    topRatedState,
    topRatedMessage,
    topRatedMovies
  ];
}

//class MoviesInitial extends MoviesState {}
