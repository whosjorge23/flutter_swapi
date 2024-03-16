import 'package:flutter/material.dart';
import 'package:flutter_swapi/details_page.dart';
import 'package:flutter_swapi/network/character_repository.dart';
import 'package:flutter_swapi/service/api_service.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHomePage(title: 'Flutter SWAPI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> listCharacters = [];
  var pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CharacterRepository().allCharacters("?page=${pageNumber}").then(
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
                CharacterRepository().allCharacters("?page=${pageNumber}").then(
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
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: listCharacters.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: index >= 16
                  ? Image.network(
                      "https://starwars-visualguide.com/assets/img/characters/${index + 2}.jpg")
                  : Image.network(
                      "https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg"),
              trailing: TextButton(
                onPressed: () => {
                  // print("Button pressed: ${listCharacters[index]}"),
                  // print("Button pressed: $index"),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        character: listCharacters[index],
                        index: index,
                      ),
                    ),
                  ),
                },
                child: const Text(
                  "Details",
                  style: TextStyle(color: Colors.amber, fontSize: 15),
                ),
              ),
              title: Text(
                "${listCharacters[index].name}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
