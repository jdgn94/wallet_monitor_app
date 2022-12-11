import 'package:flutter/material.dart';

class IconButtonGlobal extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color? color;
  final double? size;
  final bool? disabled;

  IconButtonGlobal({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.size = 16.0,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled == true ? null : () => onPressed(),
      child: Icon(
        icon,
        color: color ??
            (Theme.of(context).colorScheme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black),
        size: size,
      ),
    );
  }
}
