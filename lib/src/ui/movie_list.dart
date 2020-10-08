import 'package:flutter/material.dart';

import '../models/item.dart';
import '../blocs/movies.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.moviesFetcher.stream,
        builder: (context, AsyncSnapshot<Item> snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<Item> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              fit: BoxFit.cover);
        });
  }
}
