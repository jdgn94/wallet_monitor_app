import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.white,
      // background: Colors.blue.w(),
    ),
    shadowColor: Colors.grey[800]!,
    brightness: Brightness.dark,
  );
}
