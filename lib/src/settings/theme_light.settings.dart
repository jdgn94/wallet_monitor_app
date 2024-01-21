import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: Colors.green[100]!,
      onPrimary: Colors.black,
    ),
  );
}
