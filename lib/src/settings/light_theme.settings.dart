import 'package:flutter/material.dart';

ThemeData lightTheme({required Color color}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: color,
      onPrimary: Colors.black,
    ),
    shadowColor: Colors.grey[800]!,
    brightness: Brightness.light,
  );
}
