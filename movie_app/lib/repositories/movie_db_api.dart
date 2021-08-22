import 'package:dio/dio.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/models/movies_details_dto.dart';
import 'package:movie_app/models/movies_dto.dart';
import 'package:movie_app/models/tv_show_details_dto.dart';
import 'package:movie_app/models/tv_shows_dto.dart';

class MovieDbApi {
  // Fetch movies popular
  Future<MoviesDto> getMoviesPopular() async {
    var path = 'movie/popular';
    var param = '?api_key=';
    MoviesDto output = MoviesDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = MoviesDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }

  // Fetch top rated
  Future<MoviesDto> getMoviesTopRated() async {
    var path = 'movie/top_rated';
    var param = '?api_key=';
    MoviesDto output = MoviesDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = MoviesDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }

  // Fetch movie details
  Future<MovieDetailsDto> getMovieDetails(String movieId) async {
    var path = 'movie/$movieId';
    var param = '?api_key=';
    MovieDetailsDto output = MovieDetailsDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = MovieDetailsDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }

  // Fetch tv shows top rated
  Future<TvShowsDto> getTvShowsTopRated() async {
    var path = 'tv/top_rated';
    var param = '?api_key=';
    TvShowsDto output = TvShowsDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = TvShowsDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }

  // Fetch tv shows popular
  Future<TvShowsDto> getTvShowsPopular() async {
    var path = 'tv/popular';
    var param = '?api_key=';
    TvShowsDto output = TvShowsDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = TvShowsDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }

  // Fetch tv shows details
  Future<TvShowDetailsDto> getTvShowDetails(String tvId) async {
    var path = 'tv/$tvId';
    var param = '?api_key=';
    TvShowDetailsDto output = TvShowDetailsDto();

    try {
      Dio _dio = Dio();
      Response response = await _dio.get(BASE_API + path + param + API_KEY);
      if (response.statusCode == 200) {
        output = TvShowDetailsDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }
}
