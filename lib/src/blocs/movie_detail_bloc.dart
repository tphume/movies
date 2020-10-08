import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../models/trailer.dart';
import '../resources/repository.dart';

class MovieDetailBloc {
  final repository = Repository();
  final movieId = PublishSubject<int>();
  final trailers = BehaviorSubject<Future<Trailer>>();

  Function(int) get fetchTrailersById => movieId.sink.add;

  Stream<Future<Trailer>> get movieTrailers => trailers.stream;

  MovieDetailBloc() {
    movieId.stream.transform(_itemTransformer()).pipe(trailers);
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<Trailer> trailer, int id, int index) {
        print(index);
        trailer = repository.fetchTrailers(id);
        return trailer;
      },
    );
  }

  dispose() async {
    movieId.close();
    await trailers.drain();
    trailers.close();
  }
}
