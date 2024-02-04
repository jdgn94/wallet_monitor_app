import 'package:flutter/material.dart';

enum CustomButtonType { normal, tonal, text, outlined }

class CustomButtonWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final CustomButtonType type;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final IconData? prependIcon;
  final IconData? appendIcon;
  final String? text;
  final double size;
  final Color? color;

  CustomButtonWidget({
    super.key,
    this.margin,
    this.padding,
    this.type = CustomButtonType.normal,
    this.onTap,
    this.width,
    this.height,
    this.prependIcon,
    this.appendIcon,
    this.text,
    this.color,
    this.size = 24,
  });

  final BorderRadius borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: _buttonStyle(context),
      ),
    );
  }

  Widget _buttonStyle(BuildContext context) {
    switch (type) {
      case CustomButtonType.text:
        return _textButton(context);
      default:
        return _normalButton(context);
    }
  }

  Ink _normalButton(context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary.withOpacity(0.7),
        borderRadius: borderRadius,
      ),
      child: _buttonContent(context),
    );
  }

  Ink _textButton(context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius,
      ),
      child: _buttonContent(
        context,
        colorText: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Padding _buttonContent(BuildContext context, {Color? colorText}) {
    colorText = colorText ?? Theme.of(context).colorScheme.onBackground;
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Wrap(
        children: [
          if (prependIcon != null)
            Icon(
              prependIcon,
              size: size,
              color: colorText,
            ),
          if (prependIcon != null) const SizedBox(width: 10),
          if (text != null)
            Text(
              text!,
              style: TextStyle(fontSize: size, color: colorText),
            ),
          if (appendIcon != null) const SizedBox(width: 10),
          if (appendIcon != null)
            Icon(
              appendIcon,
              size: size,
              color: colorText,
            ),
        ],
      ),
    );
  }
}
