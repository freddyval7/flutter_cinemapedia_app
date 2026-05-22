import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia_app/config/constants/environment.dart';
import 'package:flutter_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.theMovieDbUrl,
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es-MX",
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");
    final List<Movie> movies = [];

    return movies;
  }
}
