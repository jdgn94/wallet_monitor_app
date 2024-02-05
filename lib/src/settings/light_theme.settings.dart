import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.black,
    ),
    shadowColor: Colors.grey[800]!,
    brightness: Brightness.light,
  );
}
