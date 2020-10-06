import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  int page;
  List<Result> results;

  @JsonKey(name: 'total_results')
  int totalResults;

  @JsonKey(name: 'total_pages')
  int totalPages;

  Item(this.page, this.results, this.totalResults, this.totalPages);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Result {
  int id;
  String title;
  String overview;
  double popularity;
  bool video;
  bool adult;

  @JsonKey(name: 'vote_count')
  int voteCount;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'backdrop_path')
  String backDropPath;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  @JsonKey(name: 'release_date')
  String releaseDate;

  Result(
      this.id,
      this.title,
      this.overview,
      this.popularity,
      this.video,
      this.adult,
      this.voteCount,
      this.posterPath,
      this.backDropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.voteAverage,
      this.releaseDate);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
