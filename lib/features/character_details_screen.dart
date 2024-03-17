import 'package:flutter/material.dart';
import 'package:flutter_swapi/models/planet.dart';
import 'package:flutter_swapi/models/swapi.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:gap/gap.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int index;
  final Result character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
    required this.index,
  }) : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  Planet? planetInfo;

  @override
  void initState() {
    super.initState();
    loadPlanetInfo();
  }

  void loadPlanetInfo() async {
    try {
      final planet = await planetRepository.planetInfo("${widget.character.homeworld}");
      if (mounted) {
        setState(() {
          planetInfo = planet;
        });
      }
    } catch (e) {
      // Handle errors or exceptions if necessary
      debugPrint('Error loading planet info: $e');
    }
  }

  Widget _buildCharacterInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Color(0xffFFEE58))),
          Text(value, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFEE58),
        title: Text("${widget.character.name}", style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
      ),
      body: planetInfo == null
          ? const Center(child: CircularProgressIndicator(color: Colors.yellowAccent))
          : SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                imagesService.getImageCharacter(widget.index),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            _buildCharacterInfoRow("Name", "${widget.character.name}"),
            _buildCharacterInfoRow("Height", "${widget.character.height} cm"),
            _buildCharacterInfoRow("Weight", "${widget.character.mass} kg"),
            _buildCharacterInfoRow("Hair", "${widget.character.hairColor}"),
            _buildCharacterInfoRow("Skin", "${widget.character.skinColor}"),
            _buildCharacterInfoRow("Eyes", "${widget.character.eyeColor}"),
            _buildCharacterInfoRow("Birth Year", "${widget.character.birthYear}"),
            _buildCharacterInfoRow("Gender", "${widget.character.gender}"),
            _buildCharacterInfoRow("Planet", planetInfo?.name ?? "Loading..."),
            Gap(32)
          ],
        ),
      ),
    );
  }
}
