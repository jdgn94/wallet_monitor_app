import 'package:flutter/material.dart';

class AlertColors {
  static Color success = Colors.green;
  static Color error = Colors.red;
  static Color warning = Colors.orange[700]!;
  static Color info = Colors.blue;
  static Color onAlert = Colors.white;
}

class DefaultColors {
  static Color pink = Colors.pink;
  static Color red = Colors.red;
  static Color deepOrange = Colors.deepOrange;
  static Color orange = Colors.orange;
  static Color amber = Colors.amber;
  static Color yellow = Colors.yellow;
  static Color lime = Colors.lime;
  static Color lightGreen = Colors.lightGreen;
  static Color green = Colors.green;
  static Color teal = Colors.teal;
  static Color cyan = Colors.cyan;
  static Color lightBlue = Colors.lightBlue;
  static Color blue = Colors.blue;
  static Color indigo = Colors.indigo;
  static Color purple = Colors.purple;
  static Color deepPurple = Colors.deepPurple;
  static Color blueGray = Colors.blueGrey;
  static Color brown = Colors.brown;
  static Color grey = Colors.grey;
}

Color backgroundTone({required BuildContext context, Color? color}) {
  double opacity = 0.1;
  if (Theme.of(context).colorScheme.brightness == Brightness.light) {
    opacity = 0.2;
  }

  return (color ?? Theme.of(context).colorScheme.primary).withOpacity(opacity);
}
