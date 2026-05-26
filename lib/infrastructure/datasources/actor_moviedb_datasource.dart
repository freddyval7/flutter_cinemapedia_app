import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia_app/config/constants/environment.dart';
import 'package:flutter_cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/actor.dart';
import 'package:flutter_cinemapedia_app/infrastructure/mappers/actor_mapper.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/credits_reponse.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get("/movie/$movieId/credits");

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
