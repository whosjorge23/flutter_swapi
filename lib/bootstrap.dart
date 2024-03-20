import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swapi/network/character_repository.dart';
import 'package:flutter_swapi/network/planet_repository.dart';
import 'package:flutter_swapi/service/context_service.dart';
import 'package:flutter_swapi/service/images_service.dart';
import 'package:flutter_swapi/theme/app_colors.dart';
import 'package:get_it/get_it.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerSingletons();

  setDeviceOrientation();
}

/// Create singletons (services) that can be shared across the app.
void _registerSingletons() {
  final contextService = ContextService();
  // Global Context
  GetIt.I.registerSingleton<ContextService>(contextService);

  //NetworkClient

  // RouteObserver
  GetIt.I.registerSingleton(RouteObserver<ModalRoute<void>>());

  //Repositories
  GetIt.I.registerSingleton<CharacterRepository>(CharacterRepository());
  GetIt.I.registerSingleton<PlanetRepository>(PlanetRepository());

  //Services
  GetIt.I.registerSingleton<ImagesService>(ImagesService());
  GetIt.I.registerLazySingleton<AppColors>(() => AppColors());
}

void setDeviceOrientation() {
  final orientations = <DeviceOrientation>[];

  orientations.addAll([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setPreferredOrientations(orientations);
}
