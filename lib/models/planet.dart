import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'planet.g.dart';

@JsonSerializable()
class Planet {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "rotation_period")
  String? rotationPeriod;
  @JsonKey(name: "orbital_period")
  String? orbitalPeriod;
  @JsonKey(name: "diameter")
  String? diameter;
  @JsonKey(name: "climate")
  String? climate;
  @JsonKey(name: "gravity")
  String? gravity;
  @JsonKey(name: "terrain")
  String? terrain;
  @JsonKey(name: "surface_water")
  String? surfaceWater;
  @JsonKey(name: "population")
  String? population;
  @JsonKey(name: "residents")
  List<String>? residents;
  @JsonKey(name: "films")
  List<String>? films;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "edited")
  DateTime? edited;
  @JsonKey(name: "url")
  String? url;

  Planet({
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}
