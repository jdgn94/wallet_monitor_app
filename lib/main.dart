import 'package:flutter/material.dart';
import 'package:wallet_monitor/settings/theme_light.dart';
import 'package:wallet_monitor/src/routes/index.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Monitor',
      // debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: "/",
      theme: lightTheme(),
    );
  }
}
