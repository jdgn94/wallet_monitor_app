import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/screens/home_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomeScreen(),
  };
}
