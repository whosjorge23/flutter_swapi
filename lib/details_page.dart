import 'package:flutter/material.dart';
import 'package:flutter_swapi/models/planet.dart';
import 'package:flutter_swapi/network/planet_repository.dart';
import 'package:flutter_swapi/service/api_service.dart';

import 'models/swapi.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.character, required this.index})
      : super(key: key);
  int index;
  Result character;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Planet? planetInfo;

  @override
  void initState() {
    super.initState();
    loadPlanetInfo();
  }

  void loadPlanetInfo() async {
    try {
      final planet = await PlanetRepository().planetInfo("${widget.character.homeworld}");
      if (mounted) {
        setState(() {
          planetInfo = planet;
        });
      }
    } catch (e) {
      // Handle errors or exceptions if necessary
      print('Error loading planet info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Color(0xffFFEE58),
        title: Text(
          "${widget.character.name}",
          style: TextStyle(color: Colors.black),
        ),
        actions: [],
      ),
      body: Container(
        child: Center(
          child: planetInfo != null
              ? Column(
                  children: [
                    widget.index >= 16
                        ? Image.network(
                            "https://starwars-visualguide.com/assets/img/characters/${widget.index + 2}.jpg",
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        : Image.network(
                            "https://starwars-visualguide.com/assets/img/characters/${widget.index + 1}.jpg",
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.name}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Height:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.height}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Weight:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.mass}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Hair:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.hairColor}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Skin:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.skinColor}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Eyes:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.eyeColor}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Birth Year:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.birthYear}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Gender:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character.gender}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Planet:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${planetInfo?.name}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
