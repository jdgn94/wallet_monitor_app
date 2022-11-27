import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_monitor/src/repositories/preferenceRepository.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  static const String _localeLanguageCodeKey = 'localeLanguageCode';
  static const String _localeScriptCodeKey = 'localeScriptCode';
  static const String _localeCountryCodeKey = 'localeCountryCode';

  @override
  Future<void> saveLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(_localeLanguageCodeKey, locale.languageCode);
    await preferences.setString(_localeScriptCodeKey, locale.scriptCode ?? "");
    await preferences.setString(
        _localeCountryCodeKey, locale.countryCode ?? "");
  }

  @override
  Future<Locale> get locale async {
    final preferences = await SharedPreferences.getInstance();

    final languageCode = preferences.getString(_localeLanguageCodeKey);
    final scriptCode = preferences.getString(_localeScriptCodeKey);
    final countryCode = preferences.getString(_localeCountryCodeKey);

    if (languageCode != null) {
      return Locale.fromSubtags(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
    }

    return const Locale.fromSubtags();
  }

  @override
  Future<void> saveTheme(String theme) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('theme', theme);
  }

  @override
  // TODO: implement theme
  Future<String> get theme async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString('theme') ?? 'system';
  }
}
