import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'package:wallet_monitor/src/bloc/global/global_bloc.dart';
import 'package:wallet_monitor/src/settings/dark_theme.settings.dart';
import 'package:wallet_monitor/src/settings/light_theme.settings.dart';
import 'package:wallet_monitor/src/routes/index.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsLocalStorage.configureSettings();

  final pref = SettingsLocalStorage.pref;

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
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeMode _setThemeMode(String mode) {
    if (mode == "light") return ThemeMode.light;
    if (mode == "dark") return ThemeMode.dark;
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Wallet Monitor',
          debugShowCheckedModeBanner: false,
          routes: getApplicationRoutes(),
          initialRoute: "/",
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: _setThemeMode(state.themeMode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale.fromSubtags(
            languageCode: state.lang,
          ),
        );
      },
    );
  }
}
