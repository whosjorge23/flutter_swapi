import 'package:flutter/material.dart';
import 'package:flutter_swapi/features/details_page.dart';
import 'package:flutter_swapi/features/home_screen.dart';
import 'package:flutter_swapi/models/swapi.dart';
import 'package:go_router/go_router.dart';


class ScreenPaths {
  static String home = '/home';
  static String characterDetails = '/character_details';

}

NoTransitionPage pageBuilder(Widget widget) {
  return NoTransitionPage(child: widget);
}

GoRouter createGoRouter({
  required GlobalKey<NavigatorState> navigatorKey,
}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: ScreenPaths.home,
    routes: [
      GoRoute(
        path: ScreenPaths.home,
        parentNavigatorKey: navigatorKey,
        pageBuilder: (context, state) {
          return pageBuilder(
            HomeScreen(title: 'Flutter Swapi',),

          );
        },
      ),
      GoRoute(
        path: ScreenPaths.characterDetails,
        parentNavigatorKey: navigatorKey,
        pageBuilder: (context, state) {
          Map<String, Object?> characterDetails = state.extra as Map<String, Object?>;
          return pageBuilder(CharacterDetails(character: characterDetails['character']! as Result, index: characterDetails['index']! as int));
        },
      ),
    ],
    debugLogDiagnostics: true,
  );
}
