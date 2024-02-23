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
  final double fontSize;
  final Color? color;
  final bool centerText;

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
    this.fontSize = 24,
    this.centerText = false,
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
              size: fontSize,
              color: colorText,
            ),
          if (prependIcon != null) const SizedBox(width: 10),
          if (text != null) _buttonText(colorText),
          if (appendIcon != null) const SizedBox(width: 10),
          if (appendIcon != null)
            Icon(
              appendIcon,
              size: fontSize,
              color: colorText,
            ),
        ],
      ),
    );
  }

  Widget _buttonText(Color colorText) {
    if (centerText) {
      return SizedBox(
        width: double.infinity,
        child: Text(
          text!,
          style: TextStyle(fontSize: fontSize, color: colorText),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Text(
        text!,
        style: TextStyle(fontSize: fontSize, color: colorText),
      );
    }
  }
}
