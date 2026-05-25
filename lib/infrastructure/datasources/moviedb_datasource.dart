import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia_app/config/constants/environment.dart';
import 'package:flutter_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';

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
    final response = await dio.get(
      "/movie/now_playing",
      queryParameters: {"page": page},
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((movieDB) => movieDB.posterPath != "no-poster")
        .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
        .toList();

    return movies;
  }
}
