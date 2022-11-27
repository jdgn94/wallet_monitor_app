import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/colorSchema.dart';

class TextButtonGlobal extends StatelessWidget {
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  final String text;
  final VoidCallback? callback;
  final Size? size;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final bool disabledButton;
  final MainAxisAlignment mainAxisAlignment;

  @override
  TextButtonGlobal({
    Key? key,
    required this.text,
    required this.callback,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.disabledButton = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  Color defaultTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabledButton ? null : callback,
      style: TextButton.styleFrom(
        fixedSize: size ?? Size(MediaQuery.of(context).size.width, 22.0),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: textColor ?? defaultTextColor(context),
            ),
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? defaultTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
