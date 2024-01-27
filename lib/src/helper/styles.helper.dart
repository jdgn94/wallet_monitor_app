import 'package:flutter/material.dart';

class StylesHelper {
  static BoxShadow boxShadow(BuildContext context) {
    return BoxShadow(
      color: Theme.of(context).shadowColor,
      blurRadius: 10.0,
    );
  }
}
