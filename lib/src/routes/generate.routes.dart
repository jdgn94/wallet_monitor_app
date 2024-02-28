import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/argument.helper.dart';

import 'package:wallet_monitor/src/screens/create_account.screen.dart';
import 'package:wallet_monitor/src/screens/home.screen.dart';
import 'package:wallet_monitor/src/screens/initial_config.screen.dart';
import 'package:wallet_monitor/src/screens/splash.screen.dart';
import 'package:wallet_monitor/src/screens/welcome.screen.dart';

MaterialPageRoute generateApplicationRoutes(RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomeScreen(),
    "/splash": (BuildContext context) => const SplashScreen(),
    "/welcome": (BuildContext context) => const WelcomeScreen(),
    "/initial_config": (BuildContext context) => const InitialConfigScreen(),
    "/account": (BuildContext context) =>
        CreateAccountScreen(args: settings.arguments as AccountArguments),
  };
  WidgetBuilder builder = routes[settings.name]!;
  return MaterialPageRoute(builder: (BuildContext context) => builder(context));
}
