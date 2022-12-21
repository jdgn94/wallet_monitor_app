// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences pref;
  SettingsBloc({required this.pref})
      : super(SettingsState(
          theme: pref.getString('theme')!,
          lang: Locale.fromSubtags(
            languageCode: pref.getString('lang') ?? 'und',
          ),
        )) {
    // ignore: void_checks
    on<SettingsEvent>((event, emit) {
      if (event is ChangeTheme) {
        pref.setString('theme', event.theme);
        emit(
          SettingsState(
            theme: pref.getString('theme')!,
            lang: Locale.fromSubtags(
                languageCode: pref.getString('lang') ?? 'und'),
          ),
        );
      }

      if (event is ChangeLanguage) {
        if (event.language == "") {
          pref.remove('lang');
        } else {
          pref.setString('lang', event.language);
        }
        emit(
          SettingsState(
            theme: pref.getString('theme')!,
            lang: Locale.fromSubtags(
                languageCode: pref.getString('lang') ?? 'und'),
          ),
        );
      }
    });
  }
}
