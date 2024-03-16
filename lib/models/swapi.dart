import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'swapi.g.dart';

@JsonSerializable()
class Swapi {
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "next")
  String? next;
  @JsonKey(name: "previous")
  dynamic previous;
  @JsonKey(name: "results")
  List<Result>? results;

  Swapi({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory Swapi.fromJson(Map<String, dynamic> json) => _$SwapiFromJson(json);

  Map<String, dynamic> toJson() => _$SwapiToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "height")
  String? height;
  @JsonKey(name: "mass")
  String? mass;
  @JsonKey(name: "hair_color")
  String? hairColor;
  @JsonKey(name: "skin_color")
  String? skinColor;
  @JsonKey(name: "eye_color")
  String? eyeColor;
  @JsonKey(name: "birth_year")
  String? birthYear;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "homeworld")
  String? homeworld;
  @JsonKey(name: "films")
  List<String>? films;
  @JsonKey(name: "species")
  List<String>? species;
  @JsonKey(name: "vehicles")
  List<String>? vehicles;
  @JsonKey(name: "starships")
  List<String>? starships;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "edited")
  DateTime? edited;
  @JsonKey(name: "url")
  String? url;

  Result({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
