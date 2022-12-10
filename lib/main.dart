import 'package:flutter/material.dart';
// -----------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/settings/settings_bloc.dart';
// -----------------------------
import "package:wallet_monitor/src/db/index.dart";
import 'package:wallet_monitor/src/localStorage/settings.dart';
import "package:wallet_monitor/src/routes/index.dart";
import "package:wallet_monitor/src/settings/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsLocalStorage.configureSettings();
  await DB.initDB();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  final pref = SettingsLocalStorage.pref;
  AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(create: (_) => SettingsBloc(pref: pref)),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Wallet Monitor',
          debugShowCheckedModeBanner: false,
          theme: themeLight(),
          darkTheme: themeDark(),
          themeMode: getThemeMode(state.theme),
          routes: getApplicationRouters(),
          initialRoute: "/splash",
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.lang,
        );
      },
    );
  }

  ThemeMode getThemeMode(String mode) {
    print("mode application: $mode");
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }
}
