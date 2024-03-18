import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swapi/features/cubit/swapi_cubit.dart';
import 'package:flutter_swapi/routes/go_router_config.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiCubit, SwapiState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            backgroundColor: Color(0xffFFEE58),
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.black),
            ),
            actions: const [],
          ),
          body: state.characters != null
              ? ListView.builder(
                  itemCount: state.characters?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: ListTile(
                        leading: Image.network(imagesService.getImageCharacter(index)),
                        trailing: TextButton(
                          onPressed: () => {
                            // print("Button pressed: ${listCharacters[index]}"),
                            // print("Button pressed: $index"),
                            context.push(ScreenPaths.characterDetails, extra: {
                              'character': state.characters?[index],
                              'index': index,
                            })
                          },
                          child: const Text(
                            "Details",
                            style: TextStyle(color: Color(0xffFFEE58), fontSize: 15),
                          ),
                        ),
                        title: Text(
                          "${state.characters?[index].name}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  })
              : Center(child: Lottie.asset('assets/lottie/loader.json')),
        );
      },
    );
  }
}
