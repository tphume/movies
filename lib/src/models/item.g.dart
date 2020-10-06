// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['page'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_results'] as int,
    json['total_pages'] as int,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['video'] as bool,
    json['adult'] as bool,
    json['vote_count'] as int,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    (json['vote_average'] as num)?.toDouble(),
    json['release_date'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'video': instance.video,
      'adult': instance.adult,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backDropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
    };
