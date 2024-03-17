import 'package:flutter/material.dart';
import 'package:flutter_swapi/routes/go_router_config.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> listCharacters = [];
  var pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    characterRepository.allCharacters("?page=${pageNumber}").then(
          (value) => {
        if (value != null)
          {
            pageNumber += 1,
            for (var item in value.results!)
              {
                listCharacters.add(item),
                setState(() {}),
              },
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Color(0xffFFEE58),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (pageNumber <= 9) {
                characterRepository.allCharacters("?page=${pageNumber}").then(
                      (value) => {
                    if (value != null)
                      {
                        pageNumber += 1,
                        setState(() {}),
                        for (var item in value.results!)
                          {
                            listCharacters.add(item),
                          },
                      }
                  },
                );
              } else {
                const snackBar = SnackBar(
                  content: Text('No more StarWars characters to load!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: listCharacters.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
              child: ListTile(
                leading:
                Image.network(imagesService.getImageCharacter(index)),
                trailing: TextButton(
                  onPressed: () => {
                    // print("Button pressed: ${listCharacters[index]}"),
                    // print("Button pressed: $index"),
                  context.push(ScreenPaths.characterDetails, extra: {
                  'character': listCharacters[index],
                  'index': index,
                  })
                  },
                  child: const Text(
                    "Details",
                    style: TextStyle(color: Color(0xffFFEE58), fontSize: 15),
                  ),
                ),
                title: Text(
                  "${listCharacters[index].name}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}