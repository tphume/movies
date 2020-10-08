// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trailer _$TrailerFromJson(Map<String, dynamic> json) {
  return Trailer(
    json['id'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'id': instance.id,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['id'] as String,
    json['iso_639_1'] as String,
    json['iso_3166_1'] as String,
    json['name'] as String,
    json['site'] as String,
    json['size'] as int,
    json['type'] as String,
    json['key_hello'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'key_hello': instance.keyHello,
    };
