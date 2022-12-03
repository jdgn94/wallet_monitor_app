import 'package:flutter/material.dart';

class ColorSchemaApp {
  final Color primaryMoreLight = Colors.teal.shade200;
  final Color primaryLight = Colors.teal.shade400;
  final Color primary = Colors.teal;
  final Color primaryDark = Colors.teal.shade600;
  final Color primaryMoreDark = Colors.teal.shade800;
  final Color secondary = Colors.purple;
  final Color error = Colors.red;
  final Color info = Colors.blue;
  final Color warning = Colors.orange;
  final Color success = Colors.green;
  final Color notificationText = Colors.white;

  Color darkenColor(Color color, [double opacity = .1]) {
    assert(opacity >= 0 && opacity <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark =
        hsl.withLightness((hsl.lightness - opacity).clamp(0.0, 1.0));

    return hslDark.toColor().withAlpha(50);
  }

  Color lightenColor(Color color, [double opacity = .1]) {
    assert(opacity >= 0 && opacity <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + opacity).clamp(0.0, 1.0));

    return hslLight.toColor().withAlpha(50);
  }
}
