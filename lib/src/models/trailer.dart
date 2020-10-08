import 'package:json_annotation/json_annotation.dart';

part 'trailer.g.dart';

@JsonSerializable(explicitToJson: true)
class Trailer {
  int id;
  List<Result> result;

  Trailer(this.id, this.result);

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Result {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String name;
  String site;
  int size;
  String type;

  @JsonKey(name: 'key_hello')
  String keyHello;

  Result(this.id, this.iso_639_1, this.iso_3166_1, this.name, this.site,
      this.size, this.type, this.keyHello);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
