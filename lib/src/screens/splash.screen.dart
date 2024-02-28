import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/helper/constants/image.constants.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _verifyInitialPage(BuildContext context) async {
    final pref = SettingsLocalStorage.configPref;
    if (pref.getBool('visiteWelcomeScreen') == null) {
      pref.setBool("visiteWelcomeScreen", true);
      return;
    }
    if (pref.getBool("visiteInitialConfigScreen") == null) {
      pref.setBool("visiteInitialConfigScreen", false);
      return;
    }

    if (pref.getBool("visiteWelcomeScreen")!) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/welcome", (route) => false);
      return;
    }
    if (pref.getBool("visiteInitialConfigScreen")!) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/initial_config", (route) => false);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      "/",
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _verifyInitialPage(context));

    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstants.logo,
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}
