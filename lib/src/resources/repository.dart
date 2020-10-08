import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item.dart';
import '../models/trailer.dart';

class Repository {
  final MovieApiProvider movieApiProvider = MovieApiProvider();

  Future<Item> fetchAllMovies() async => movieApiProvider.fetchMovieList();

  Future<Trailer> fetchTrailer(int movieId) async =>
      movieApiProvider.fetchTrailer(movieId);
}
