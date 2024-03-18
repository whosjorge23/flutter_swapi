import 'package:dio/dio.dart';
import 'package:flutter_swapi/models/swapi.dart';

class CharacterRepository {
  static const String _baseUrl = "https://swapi.dev/api/people/";
  final Dio _dio;

  CharacterRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Swapi?> allCharacters(String page) async {
    try {
      final response = await _dio.get("$_baseUrl$page");
      if (response.statusCode == 200) {
        Swapi swapiResponse = Swapi.fromJson(response.data);
        return swapiResponse;
      } else {
        print("Error: Failed to load characters, status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: ${e.toString()}");
      return null;
    }
  }
}
