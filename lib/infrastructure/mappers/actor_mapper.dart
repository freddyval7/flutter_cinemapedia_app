import 'package:flutter_cinemapedia_app/domain/entities/actor.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/credits_reponse.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
        ? "https://image.tmdb.org/t/p/w500/${cast.profilePath}.jpg"
        : "https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg",
    character: cast.character,
  );
}
