import 'package:wallet_monitor/src/services/localStorage.dart';

class SettingsBloc {
  late final String lang;
  late final String theme;

  SettingsBloc() {
    final langStorage = LocalStorage.preferences.getString('lang');
    final themeStorage = LocalStorage.preferences.getString('theme');
    lang = langStorage ?? 'en';
    theme = themeStorage ?? 'system';
    if (langStorage == null) {
      LocalStorage.preferences.setString('lang', 'en');
    }
    if (themeStorage == null) {
      LocalStorage.preferences.setString('theme', 'system');
    }
  }

  Stream<String> get getLang async* {
    yield lang;
  }

  Stream<String> get getTheme async* {
    yield theme;
  }
}
