import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swapi/features/cubit/swapi_cubit.dart';
import 'package:flutter_swapi/models/planet.dart';
import 'package:flutter_swapi/models/swapi.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int index;
  final Character character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
    required this.index,
  }) : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SwapiCubit>().loadPlanetInfo(widget.character.homeworld!);
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
    return BlocBuilder<SwapiCubit, SwapiState>(
      builder: (context, state) {
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
          body: state.planet == null
              ? Center(
                  child: Lottie.asset(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.height * 0.20,
                      'assets/lottie/loader.json'))
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
                      _buildCharacterInfoRow("Planet", state.planet?.name ?? "Loading..."),
                      Gap(32)
                    ],
                  ),
                ),
        );
      },
    );
  }
}
