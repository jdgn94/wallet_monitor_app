import 'package:flutter/widgets.dart';
import 'package:wallet_monitor/src/pages/homePage.dart';
import 'package:wallet_monitor/src/pages/logInPage.dart';
import 'package:wallet_monitor/src/pages/signUpPage.dart';

Map<String, WidgetBuilder> getApplicationRouters() {
  return <String, WidgetBuilder>{
    "/log_in": (BuildContext context) => const LogInPage(),
    "/sign_up": (BuildContext context) => const SignUpPage(),
    "/home": (BuildContext context) => const HomePage(),
  };
}
