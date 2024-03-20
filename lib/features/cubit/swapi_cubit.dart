import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swapi/models/planet.dart';
import 'package:flutter_swapi/models/swapi.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swapi_state.dart';
part 'swapi_cubit.freezed.dart';

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit() : super(const SwapiState.initial()){
    loadCharacters();
  }

  void loadPlanetInfo(String homeworldUrl) async {
    try {
      final planet = await planetRepository.planetInfo(homeworldUrl);
      emit(state.copyWith(planet: planet));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadCharacters() async {
    int pageNumber = 1;
    bool hasMore = true;
    List<Character> newCharacters = []; // Temporarily hold new characters

    while (pageNumber <= 9 && hasMore) {
      try {
        final charactersResponse = await characterRepository.allCharacters("?page=$pageNumber");
        if (charactersResponse != null && charactersResponse.results != null && charactersResponse.results!.isNotEmpty) {
          newCharacters.addAll(charactersResponse.results!); // Assumed results is List<Character>?
          pageNumber++;
        } else {
          hasMore = false; // No more characters to fetch
        }
      } catch (e) {
        debugPrint(e.toString());
        hasMore = false; // Stop on error
      }
    }

    if (newCharacters.isNotEmpty) {
      emit(state.copyWith(characters: newCharacters)); // Emit once with all new characters
    }
  }
}
