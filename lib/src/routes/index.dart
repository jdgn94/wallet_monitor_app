import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/screens/home.screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomeScreen(),
  };
}
