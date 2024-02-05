import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.white,
    ),
    shadowColor: Colors.grey[800]!,
    brightness: Brightness.dark,
  );
}
