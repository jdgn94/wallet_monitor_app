import 'package:shared_preferences/shared_preferences.dart';

export 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalStorage {
  static late SharedPreferences prefs;

  SettingsLocalStorage();

  static Future<void> configureSettings() async {
    prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get configPrefs => prefs;
}
