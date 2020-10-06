import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import '../models/item.dart';

class MovieApiProvider {
  Client client = Client();
  static const String apiKey = String.fromEnvironment('TMDB_KEY');

  Future<Item> fetchMovieList() async {
    final response = await client
        .get('http://api.themoviedb.org/3/movie/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post with api key $apiKey');
    }
  }
}
