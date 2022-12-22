import 'package:flutter/widgets.dart';

import 'package:wallet_monitor/src/pages/home_page.dart';
import 'package:wallet_monitor/src/pages/logIn_page.dart';
import 'package:wallet_monitor/src/pages/settings_page.dart';
import 'package:wallet_monitor/src/pages/sign_up_page.dart';
import 'package:wallet_monitor/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getApplicationRouters() {
  return <String, WidgetBuilder>{
    "/log_in": (BuildContext context) => const LogInPage(),
    "/sign_up": (BuildContext context) => const SignUpPage(),
    "/splash": (BuildContext context) => const SplashPage(),
    "/home": (BuildContext context) => const HomePage(),
    "/settings": (BuildContext context) => const SettingsPage(),
    // "/add_expense": (BuildContext context) => const AddExpensePage(),
  };
}
