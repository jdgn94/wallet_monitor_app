import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences prefs;
  SettingsBloc({required this.prefs})
      : super(SettingsState(
          theme: prefs.getString('theme')!,
          lang: Locale.fromSubtags(countryCode: prefs.getString('lang')),
        )) {
    // ignore: void_checks
    on<SettingsEvent>((event, emit) {
      print("Estoy en el manejador de eventos");
      if (event is ChangeTheme) {
        print(
            "Estoy llegando al evento del cambio del tema con el valor de ${event.theme}");
        prefs.setString('theme', event.theme);
        emit(
          SettingsState(
            theme: prefs.getString('theme')!,
            lang: Locale.fromSubtags(countryCode: prefs.getString('lang')),
          ),
        );
      }
    });
  }
}
