import 'package:flutter/material.dart';

class StylesHelper {
  static BoxShadow boxShadow(BuildContext context, {Color? shadowColor}) {
    return BoxShadow(
      color: shadowColor ?? Theme.of(context).shadowColor,
      blurRadius: 10.0,
    );
  }
}
