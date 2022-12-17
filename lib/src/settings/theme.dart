import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';

ThemeData themeLight() {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: colorSchema.primary,
      onPrimary: Colors.white,
      secondary: colorSchema.primary,
      onSecondary: Colors.white,
      surface: colorSchema.primary,
      onSurface: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorSchema.primaryDark,
      foregroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: colorSchema.primary,
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorSchema.primary,
      selectedItemColor: colorSchema.primaryDark,
      unselectedItemColor: Colors.white.withOpacity(0.5),
    ),
    fontFamily: "Roboto",
    brightness: Brightness.light,
    useMaterial3: true,
  );
}

ThemeData themeDark() {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: colorSchema.primary,
      onPrimary: Colors.black,
      secondary: colorSchema.primary,
      onSecondary: Colors.black,
      surface: colorSchema.primary,
      onSurface: Colors.white,
      background: Colors.black,
      onBackground: Colors.black,
      error: Colors.red.shade300,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorSchema.primaryDark,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorSchema.primary,
      selectedItemColor: colorSchema.primaryDark,
      unselectedItemColor: Colors.black.withOpacity(0.5),
    ),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: "Roboto",
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
