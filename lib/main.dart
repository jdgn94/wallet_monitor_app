import 'package:flutter/material.dart';
import "package:wallet_monitor/src/routes/index.dart";
import "package:wallet_monitor/src/settings/theme.dart";

void main() {
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
      themeMode: ThemeMode.light,
      routes: getApplicationRouters(),
      initialRoute: "/log_in",
    );
  }
}
