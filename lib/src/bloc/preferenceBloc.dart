import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/src/repositories/preferenceRepository.dart';

abstract class PreferencesEvent extends Equatable {}

class ChangeLocale extends PreferencesEvent {
  final Locale locale;

  ChangeLocale(this.locale);

  @override
  List<Object> get props => [locale];
}

class PreferencesState extends PreferencesEvent {
  final Locale locale;
  final String theme;

  PreferencesState({required this.locale, required this.theme});

  @override
  List<Object> get props => [locale, theme];
}

class ChangeTheme extends PreferencesEvent {
  final String theme;

  ChangeTheme(this.theme);

  @override
  List<String> get props => [theme];
}

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferenceRepository _preferenceRepository;
  final PreferencesState _initialState;

  PreferencesBloc({
    required PreferenceRepository preferenceRepository,
    required Locale initialLocale,
    required String initialTheme,
  })  : _preferenceRepository = preferenceRepository,
        _initialState =
            PreferencesState(locale: initialLocale, theme: initialTheme),
        super(PreferencesState(locale: initialLocale, theme: initialTheme));

  PreferencesState get initialState => _initialState;

  Stream<PreferencesState> mapEventToState(PreferencesEvent event) async* {
    if (event is ChangeLocale) {
      await _preferenceRepository.saveLocale(event.locale);

      yield PreferencesState(locale: event.locale, theme: '');
    }

    if (event is ChangeTheme) {
      await _preferenceRepository.saveTheme(event.theme);

      yield PreferencesState(
          locale: const Locale.fromSubtags(), theme: event.theme);
    }
  }
}
