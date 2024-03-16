import 'package:flutter/material.dart';
import 'package:flutter_swapi/app.dart';
import 'package:flutter_swapi/bootstrap.dart';
import 'package:flutter_swapi/features/details_page.dart';
import 'package:flutter_swapi/network/character_repository.dart';
import 'package:flutter_swapi/service/images_service.dart';
import 'package:flutter_swapi/shared_export.dart';

void main() {
  bootstrap();
  runApp(const MainApp());
}



