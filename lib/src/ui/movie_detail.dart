import 'dart:async';
import 'package:flutter/material.dart';

import '../blocs/movie_detail_bloc.dart';
import '../blocs/movie_detail_bloc_provider.dart';
import '../models/trailer.dart';

class MovieDetail extends StatefulWidget {
  int id;
  String title;
  String overview;
  String posterPath;
  double voteAverage;
  String releaseDate;

  MovieDetail(
      {this.id,
      this.title,
      this.overview,
      this.posterPath,
      this.voteAverage,
      this.releaseDate});

  @override
  _MovieDetailState createState() => _MovieDetailState(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
      );
}

class _MovieDetailState extends State<MovieDetail> {
  int id;
  String title;
  String overview;
  String posterPath;
  double voteAverage;
  String releaseDate;

  MovieDetailBloc bloc;

  _MovieDetailState(
      {this.id,
      this.title,
      this.overview,
      this.posterPath,
      this.voteAverage,
      this.releaseDate});

  @override
  void didChangeDependencies() {
    bloc = MovieDetailBlocProvider.of(context);
    bloc.fetchTrailersById(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  "https://image.tmdb.org/t/p/w500$posterPath",
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.only(top: 5.0)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Container(margin: EdgeInsets.only(left: 1.0, right: 1.0)),
                    Text(
                      voteAverage.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Text(
                      releaseDate,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Text(
                  releaseDate,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(overview),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                StreamBuilder(
                  stream: bloc.movieTrailers,
                  builder: (context, AsyncSnapshot<Future<Trailer>> snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                        future: snapshot.data,
                        builder:
                            (context, AsyncSnapshot<Trailer> itemSnapShot) {
                          if (itemSnapShot.hasData) {
                            if (itemSnapShot.data.results.length > 0)
                              return _trailerLayout(itemSnapShot.data);
                            else
                              return _noTrailer(itemSnapShot.data);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _noTrailer(Trailer data) {
    return Center(
      child: Container(
        child: Text('No trailer available'),
      ),
    );
  }

  Widget _trailerLayout(Trailer data) {
    if (data.results.length > 1) {
      return Row(
        children: <Widget>[
          _trailerItem(data, 0),
          _trailerItem(data, 1),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          _trailerItem(data, 0),
        ],
      );
    }
  }

  _trailerItem(Trailer data, int index) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            height: 100.0,
            color: Colors.grey,
            child: Center(child: Icon(Icons.play_circle_filled)),
          ),
          Text(
            data.results[index].name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
