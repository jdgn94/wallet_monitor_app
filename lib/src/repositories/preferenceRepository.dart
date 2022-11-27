import 'dart:ui';

abstract class PreferenceRepository {
  Future<void> saveLocale(Locale locale);
  Future<void> saveTheme(String theme);

  Future<Locale> get locale;
  Future<String> get theme;
}
