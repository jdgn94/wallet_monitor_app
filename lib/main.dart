import 'package:flutter/material.dart';
import "package:wallet_monitor/src/routes/index.dart";
import 'package:wallet_monitor/src/services/localStorage.dart';
import "package:wallet_monitor/src/settings/theme.dart";

void main() async {
  await LocalStorage.configurePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Monitor',
      debugShowCheckedModeBanner: false,
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: getThemeMode(),
      routes: getApplicationRouters(),
      initialRoute: "/splash",
    );
  }
}

ThemeMode getThemeMode() {
  final mode = LocalStorage.preferences.getString('themeMode');
  if (mode == null) {
    LocalStorage.preferences.setString('themeMode', 'system');
    return ThemeMode.system;
  }
  if (mode == "dark") return ThemeMode.dark;
  if (mode == "light") return ThemeMode.light;
  return ThemeMode.system;
}
