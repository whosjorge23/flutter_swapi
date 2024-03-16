import 'package:flutter/material.dart';

class ContextService {
  late GlobalKey<NavigatorState> _globalKey;

  GlobalKey<NavigatorState> get navigatorKey => _globalKey;
  BuildContext get context => _globalKey.currentContext!;

  ContextService() {
    _globalKey = GlobalKey<NavigatorState>();
  }

  void updateGlobalKey(GlobalKey<NavigatorState> globalKey) {
    _globalKey = globalKey;
  }
}
