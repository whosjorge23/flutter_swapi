import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApisService {
  static const full_api_path = "https://swapi.dev/api/people/";

  static Future<List<dynamic>?> allCharacters(String page) async {
    try {
      final url = Uri.parse("$full_api_path$page");
      HttpClient client = HttpClient();
      var ioClient = IOClient(client);
      http.Response response = await ioClient.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var char = jsonResponse["results"];
        return char;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      print(
          "Error to establish connection with the server ${exception.toString()}");
    }
  }

  static Future<dynamic> planetInfo(String urls) async {
    try {
      final url = Uri.parse(urls);
      HttpClient client = HttpClient();
      var ioClient = IOClient(client);
      http.Response response = await ioClient.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var planet = jsonResponse;
        return planet;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      print(
          "Error to establish connection with the server ${exception.toString()}");
    }
  }
}
