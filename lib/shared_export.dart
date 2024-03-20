import 'package:flutter_swapi/network/character_repository.dart';
import 'package:flutter_swapi/network/planet_repository.dart';
import 'package:flutter_swapi/service/context_service.dart';
import 'package:flutter_swapi/service/images_service.dart';
import 'package:flutter_swapi/theme/app_colors.dart';
import 'package:get_it/get_it.dart';

ContextService get contextService => GetIt.I.get<ContextService>();

CharacterRepository get characterRepository => GetIt.I.get<CharacterRepository>();

PlanetRepository get planetRepository => GetIt.I.get<PlanetRepository>();

ImagesService get imagesService => GetIt.I.get<ImagesService>();

AppColors get appColors => GetIt.I.get<AppColors>();
