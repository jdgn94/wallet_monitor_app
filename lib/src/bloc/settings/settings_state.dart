part of 'settings_bloc.dart';

class SettingsState {
  final String theme;
  final Locale lang;

  SettingsState({
    this.theme = "system",
    this.lang = const Locale.fromSubtags(),
  });
}
