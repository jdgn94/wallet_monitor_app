part of 'global_bloc.dart';

@immutable
sealed class GlobalEvent {
  const GlobalEvent();
}

final class ChangeTheme extends GlobalEvent {
  final String themeMode;

  const ChangeTheme({required this.themeMode});
}

final class ChangeLanguage extends GlobalEvent {
  final String lang;

  const ChangeLanguage({required this.lang});
}
