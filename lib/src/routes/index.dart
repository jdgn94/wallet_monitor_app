import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/screens/account_init.screen.dart';
import 'package:wallet_monitor/src/screens/home.screen.dart';
import 'package:wallet_monitor/src/screens/language_selector.screen.dart';
import 'package:wallet_monitor/src/screens/splash.screen.dart';
import 'package:wallet_monitor/src/screens/welcome.screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomeScreen(),
    "/splash": (BuildContext context) => const SplashScreen(),
    "/welcome": (BuildContext context) => const WelcomeScreen(),
    "/language_selector": (BuildContext context) =>
        const LanguageSelectorScreen(),
    "/account_init": (BuildContext context) => const AccountInitScreen(),
  };
}
