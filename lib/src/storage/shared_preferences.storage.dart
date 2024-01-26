import 'package:shared_preferences/shared_preferences.dart';

export 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalStorage {
  static late SharedPreferences _pref;

  SettingsLocalStorage();

  static Future<void> configureSettings() async {
    _pref = await SharedPreferences.getInstance();
  }

  static SharedPreferences get configPref => _pref;
}
