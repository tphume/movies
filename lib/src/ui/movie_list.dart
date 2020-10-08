import 'package:flutter/material.dart';

import '../models/item.dart';
import '../blocs/movies.dart';

import '../blocs/movie_detail_bloc_provider.dart';
import '../ui/movie_detail.dart';

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
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => _openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

  _openDetailPage(Item data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      final result = data.results[index];

      return MovieDetailBlocProvider(
        child: MovieDetail(
          id: result.id,
          title: result.title,
          overview: result.overview,
          posterPath: result.posterPath,
          voteAverage: result.voteAverage,
          releaseDate: result.releaseDate,
        ),
      );
    }));
  }
}
