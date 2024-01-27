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
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: borderRadius,
          ),
          child: _buttonStyle(context),
        ),
      ),
    );
  }

  Widget _buttonStyle(BuildContext context) {
    switch (type) {
      default:
        return _normalButton(context);
    }
  }

  Ink _normalButton(context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        borderRadius: borderRadius,
      ),
      child: _buttonContent(context),
    );
  }

  Padding _buttonContent(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Wrap(
        children: [
          if (prependIcon != null)
            Icon(
              prependIcon,
              size: size,
            ),
          if (prependIcon != null) const SizedBox(width: 10),
          if (text != null)
            Text(
              text!,
              style: TextStyle(fontSize: size),
            ),
          if (appendIcon != null) const SizedBox(width: 10),
          if (appendIcon != null)
            Icon(
              appendIcon,
              size: size,
            ),
        ],
      ),
    );
  }
}
