import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item.dart';

class Repository {
  final MovieApiProvider movieApiProvider = MovieApiProvider();

  Future<Item> fetchAllMovies() async => movieApiProvider.fetchMovieList();
}
