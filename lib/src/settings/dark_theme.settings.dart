import 'package:flutter/material.dart';

ThemeData darkTheme({required Color color}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: color,
      onPrimary: Colors.white,
    ),
    shadowColor: Colors.grey[800]!,
    brightness: Brightness.dark,
  );
}
