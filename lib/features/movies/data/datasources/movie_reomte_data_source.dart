import 'package:dio/dio.dart';
import 'package:movies_application/core/error/exception.dart';
import 'package:movies_application/core/network/api_constance.dart';
import 'package:movies_application/core/network/error_message_model.dart';
import 'package:movies_application/features/movies/data/models/movies_details_model.dart';
import 'package:movies_application/features/movies/data/models/movies_model.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_use_case.dart';


abstract class BaseMovieRemoteDataSource
{
  Future<List<MoviesModel>> getNowPlayingMovies ();
  Future<MovieDetailModel> getMoviesDetails (MovieDetailParameters parameters);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource
{
 @override
  Future<List<MoviesModel>> getNowPlayingMovies ()async
  {
   final response= await Dio()
       .get(ApiConstance.nowPlayingMoviesPath);
   if(response.statusCode ==200)
   {
     return List<MoviesModel>.from((response.data["results"] as List).map((e) => MoviesModel.fromJson(e)));
   } else
     {
       // return throw Exception("The resource you requested could not be found.");
       return throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
     }
  }
  @override
  Future<MovieDetailModel> getMoviesDetails(MovieDetailParameters parameters)async {
    final response = await Dio().get(ApiConstance.detailsMovies(parameters.movieId));
    if(response.statusCode ==200)
    {
      return MovieDetailModel.fromJson(response.data);
    }
    else
    {
      // return throw Exception("The resource you requested could not be found.");
      return throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));

    }
  }
}