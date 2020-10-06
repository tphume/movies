import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/item.dart';

class Movies {
  final repository = Repository();
  final moviesFetcher = PublishSubject<Item>();

  fetchAllMovies() async {
    Item item = await repository.fetchAllMovies();
    moviesFetcher.sink.add(item);
  }

  dispose() {
    moviesFetcher.close();
  }
}

final bloc = Movies();
