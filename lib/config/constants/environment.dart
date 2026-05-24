import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbKey = dotenv.env["THE_MOVIEDB_KEY"] ?? "No API Key";
  static String theMovieDbUrl = dotenv.env["THE_MOVIEDB_URL"] ?? "No URL";
}
