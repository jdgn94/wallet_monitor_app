import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/argument.helper.dart';

import 'package:wallet_monitor/src/screens/create_account.screen.dart';
import 'package:wallet_monitor/src/screens/home.screen.dart';
import 'package:wallet_monitor/src/screens/language_selector.screen.dart';
import 'package:wallet_monitor/src/screens/splash.screen.dart';
import 'package:wallet_monitor/src/screens/welcome.screen.dart';

MaterialPageRoute generateApplicationRoutes(RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomeScreen(),
    "/splash": (BuildContext context) => const SplashScreen(),
    "/welcome": (BuildContext context) => const WelcomeScreen(),
    "/language_selector": (BuildContext context) =>
        const LanguageSelectorScreen(),
    "/account": (BuildContext context) =>
        CreateAccountScreen(args: settings.arguments as AccountArguments),
  };
  WidgetBuilder builder = routes[settings.name]!;
  return MaterialPageRoute(builder: (BuildContext context) => builder(context));
}
