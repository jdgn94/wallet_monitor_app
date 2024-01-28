import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'package:wallet_monitor/src/bloc/global/global_bloc.dart';
import 'package:wallet_monitor/src/controller/fetch.controller.dart';
import 'package:wallet_monitor/src/db/services/database.service.dart';
import 'package:wallet_monitor/src/routes/generate.routes.dart';
import 'package:wallet_monitor/src/settings/dark_theme.settings.dart';
import 'package:wallet_monitor/src/settings/light_theme.settings.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsLocalStorage.configureSettings();
  await DatabaseService.database();
  await FetchController.getAllCurrencies();

  final pref = SettingsLocalStorage.configPref;

  runApp(AppState(pref: pref));
}

class AppState extends StatelessWidget {
  final SharedPreferences pref;

  const AppState({super.key, required this.pref});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(create: (_) => GlobalBloc(pref: pref)),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<LocalizationsDelegate<Object>> _localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    LocaleNamesLocalizationsDelegate(),
  ];

  ThemeMode _setThemeMode(String mode) {
    if (mode == "light") return ThemeMode.light;
    if (mode == "dark") return ThemeMode.dark;
    return ThemeMode.system;
  }

  String _getLanguageSupported() {
    final String systemLang = Platform.localeName.split('_')[0];
    final List<Locale> supported = S.delegate.supportedLocales;

    for (var locale in supported) {
      if (locale.languageCode == systemLang) {
        return systemLang;
      }
    }

    return supported.first.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Wallet Monitor',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateApplicationRoutes,
          initialRoute: "/splash",
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: _setThemeMode(state.themeMode),
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale.fromSubtags(
            languageCode:
                state.lang == "und" ? _getLanguageSupported() : state.lang,
          ),
        );
      },
    );
  }
}
