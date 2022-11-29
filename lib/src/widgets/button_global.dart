import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';

class ButtonGlobal extends StatelessWidget {
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  final String text;
  final VoidCallback? callback;
  final Size? size;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final bool disabledButton;
  final bool loading;

  @override
  ButtonGlobal({
    Key? key,
    required this.text,
    required this.callback,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.disabledButton = false,
    this.loading = false,
  }) : super(key: key);

  Color defaultColor(BuildContext context) {
    if (Theme.of(context).colorScheme.brightness == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color defaultBackground(BuildContext context) {
    return colorSchema.primaryDark;
  }

  @override
  ElevatedButton build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabledButton || loading ? null : callback,
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? Size(MediaQuery.of(context).size.width, 44.0),
        backgroundColor: backgroundColor ?? defaultBackground(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && !loading)
            Icon(
              icon,
              color: defaultColor(context),
            ),
          if (icon != null && !loading) const SizedBox(width: 10),
          if (!loading)
            Text(
              text,
              style: TextStyle(
                color: textColor ?? defaultColor(context),
              ),
            ),
          if (loading)
            SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(
                color: backgroundColor ?? defaultBackground(context),
              ),
            ),
        ],
      ),
    );
  }
}
