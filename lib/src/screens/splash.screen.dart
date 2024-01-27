import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/constants/image.constants.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _verifyInitialPage(BuildContext context) async {
    final pref = SettingsLocalStorage.configPref;
    if (pref.getBool('visiteWelcomeScreen') == null) {
      pref.setBool("visiteWelcomeScreen", true);
    }
    if (pref.getBool("visiteSelectLangScreen") == null) {
      pref.setBool("visiteSelectLangScreen", false);
    }
    if (pref.getBool("visitAccountInitScreen") == null) {
      pref.setBool("visitAccountInitScreen", false);
    }

    if (pref.getBool("visiteWelcomeScreen")!) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/welcome", (route) => false);
    }
    if (pref.getBool("visiteSelectLangScreen")!) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/language_selector", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _verifyInitialPage(context));

    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstants.logo),
      ),
    );
  }
}
