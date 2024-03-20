import 'package:dio/dio.dart';
import 'package:flutter_swapi/models/planet.dart';

class PlanetRepository {
  final Dio _dio;

  PlanetRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Planet?> planetInfo(String page) async {
    try {
      final response = await _dio.get(page);
      if (response.statusCode == 200) {
        Planet planetResponse = Planet.fromJson(response.data);
        return planetResponse;
      } else {
        print("Error: Failed to load characters, status code: ${response.statusCode}");
        return null;
      }
    } on DioError catch (e) {
      print("DioError: Unable to establish connection with the server. ${e.message}");
      return null;
    } catch (e) {
      print("Exception: ${e.toString()}");
      return null;
    }
  }
}