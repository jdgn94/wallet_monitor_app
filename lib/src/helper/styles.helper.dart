import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/app_size.settings.dart';

class StylesHelper {
  static BoxShadow boxShadow(BuildContext context, {Color? shadowColor}) {
    return BoxShadow(
      color: shadowColor ?? Theme.of(context).shadowColor,
      blurRadius: 5.0,
    );
  }

  static TextStyle textStyle() {
    return TextStyle(
      fontSize: AppSizeSettings.fontSizeNormal,
      fontWeight: FontWeight.w400,
    );
  }
}
