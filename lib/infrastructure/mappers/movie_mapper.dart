import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDb movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath != ""
        ? "https://image.tmdb.org/t/p/w500/${movie.backdropPath}.jpg"
        : "https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg",
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath != ""
        ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}.jpg"
        : "no-poster",
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
