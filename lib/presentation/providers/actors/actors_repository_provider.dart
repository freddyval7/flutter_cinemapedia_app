import 'package:flutter_cinemapedia_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:flutter_cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable

final actorsRepositoryProvider = Provider((ref) {
  // Provider del DataSource
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
});
