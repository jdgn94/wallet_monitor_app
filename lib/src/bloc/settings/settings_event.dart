part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends SettingsEvent {
  final String theme;
  const ChangeTheme(this.theme);
}

class ChangeLanguage extends SettingsEvent {
  final String language;
  const ChangeLanguage(this.language);
}
