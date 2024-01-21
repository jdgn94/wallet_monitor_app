part of 'global_bloc.dart';

@immutable
sealed class GlobalState {
  final String themeMode;
  final String lang;
  final int lightMode;
  final int darkMode;
  final int primaryColor;

  const GlobalState({
    required this.themeMode,
    required this.lang,
    required this.lightMode,
    required this.darkMode,
    required this.primaryColor,
  });

  List<Object> get props => [
        themeMode,
        lang,
        lightMode,
        darkMode,
        primaryColor,
      ];
}

final class GlobalInitial extends GlobalState {
  const GlobalInitial({
    required super.themeMode,
    required super.lang,
    required super.lightMode,
    required super.darkMode,
    required super.primaryColor,
  });
}

final class UpdateGlobalState extends GlobalState {
  const UpdateGlobalState({
    required super.themeMode,
    required super.lang,
    required super.lightMode,
    required super.darkMode,
    required super.primaryColor,
  });
}
