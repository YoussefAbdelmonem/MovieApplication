class ApiConstance
{
  static const String baseUrl ="https://api.themoviedb.org/3";
  static const String apiKey ="e6665f487895172f525b01b5fcb6a48e";
  static const String nowPlayingMoviesPath ="$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String topRatedMoviesPath ="$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String popularMoviesPath ="$baseUrl/movie/popular?api_key=$apiKey";

  static  String detailsMovies(int movieId) =>"$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String recommendationsMovies(int movieId) =>"$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String imageBaseUrl ="https://image.tmdb.org/t/p/w500";

  static String imageUrl (String path)=> "$imageBaseUrl$path";

}