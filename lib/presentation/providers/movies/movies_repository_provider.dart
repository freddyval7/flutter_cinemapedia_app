import 'package:flutter_cinemapedia_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable

final movieRepositoryProvider = Provider((ref) {
  // Provider del DataSource
  return MovieRepositoryImpl(MoviedbDatasource());
});
