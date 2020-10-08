import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import '../models/item.dart';
import '../models/trailer.dart';

class MovieApiProvider {
  Client client = Client();
  static const String apiKey = String.fromEnvironment('TMDB_KEY');
  static const String baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<Item> fetchMovieList() async {
    final response = await client.get('$baseUrl/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post with api key $apiKey');
    }
  }

  Future<Trailer> fetchTrailers(int movieId) async {
    final response =
        await client.get('$baseUrl/$movieId/videos?api_key=$apiKey');

    if (response.statusCode == 200) {
      return Trailer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
