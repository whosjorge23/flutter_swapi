part of 'swapi_cubit.dart';

@freezed
class SwapiState with _$SwapiState {
  const factory SwapiState.initial({
    List<Character>? characters,
    Planet? planet,
}) = _Initial;
}
