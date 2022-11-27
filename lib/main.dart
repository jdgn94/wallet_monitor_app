import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/preferenceBloc.dart';
import 'package:wallet_monitor/src/repositories/preferenceRepositoryImpl.dart';
import "package:wallet_monitor/src/routes/index.dart";
import 'package:wallet_monitor/src/services/localStorage.dart';
import "package:wallet_monitor/src/settings/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferenceRepository = PreferenceRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferenceRepository: preferenceRepository,
    initialLocale: await preferenceRepository.locale,
    initialTheme: 'system',
  );
  await LocalStorage.configurePreferences();
  runApp(BlocProvider(
    create: (context) => preferencesBloc,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
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
          locale: state.locale,
        );
      },
    );
  }

  ThemeMode getThemeMode(String mode) {
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }
}
