import 'package:flutter/material.dart';

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

  _MovieDetailState(
      {this.id,
      this.title,
      this.overview,
      this.posterPath,
      this.voteAverage,
      this.releaseDate});

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
