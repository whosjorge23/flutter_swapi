import 'package:flutter/material.dart';
import 'package:flutter_swapi/routes/go_router_config.dart';
import 'package:flutter_swapi/shared_export.dart';
import 'package:go_router/go_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MyApp();
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => __MyAppState();
}

class __MyAppState extends State<_MyApp> {
  late GoRouter _goRouter;

  @override
  void initState() {
    _goRouter = createGoRouter(
      navigatorKey: contextService.navigatorKey,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _goRouter,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: DisableOverScroll(),
                child: Stack(
                  children: [
                    _UnFocus(
                      child: child!,
                    ),
                  ],
                ),
              );
            },
          );
  }
}

class _UnFocus extends StatelessWidget {
  const _UnFocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      ),
    );
  }
}

class DisableOverScroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
