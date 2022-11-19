import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/colorSchema.dart';

class ButtonGlobal extends StatelessWidget {
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  final String text;
  final VoidCallback callback;
  final Size? size;
  final Color? backgroundColor;
  final Color textColor;
  final IconData? icon;

  @override
  ButtonGlobal({
    Key? key,
    required this.text,
    required this.callback,
    this.size,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.icon,
  }) : super(key: key);

  @override
  ElevatedButton build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? Size(MediaQuery.of(context).size.width, 44.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: textColor,
            ),
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
