import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/settings/color_schema.dart';

class CustomButtonGlobal extends StatelessWidget {
  final colorSchema = ColorSchemaApp();
  final Widget child;
  final Function onTap;
  final Function? onDoubleTap;
  final Function? onLongPress;
  final bool disabled;
  final EdgeInsets padding;
  final double? minWidth;
  final double? width;
  final double? maxWidth;
  final double? minHeight;
  final double? height;
  final double? maxHeight;
  final Color? splashColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? backgroundColor;
  final bool isBackground;
  final BorderRadius? borderRadius;
  final double borderRadiusCircular;
  final double borderWidth;
  final Color borderColor;

  CustomButtonGlobal({
    super.key,
    required this.child,
    required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.disabled = false,
    this.padding = const EdgeInsets.all(10.0),
    this.minWidth,
    this.width,
    this.maxWidth,
    this.minHeight,
    this.height,
    this.maxHeight,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.backgroundColor,
    this.isBackground = false,
    this.borderRadius,
    this.borderRadiusCircular = 10,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
  });

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: () => disabled == false ? onTap() : null,
      onDoubleTap: () =>
          onDoubleTap == null || disabled ? null : onDoubleTap!(),
      onLongPress: () =>
          onLongPress == null || disabled ? null : onLongPress!(),
      splashColor: splashColor ?? colorSchema.primary.withOpacity(0.5),
      hoverColor: hoverColor ?? colorSchema.primary.withOpacity(.3),
      focusColor: focusColor ?? colorSchema.primary.withOpacity(.3),
      borderRadius: borderRadius ??
          BorderRadius.all(Radius.circular(borderRadiusCircular)),
      child: Container(
        constraints: BoxConstraints(
          minHeight: minHeight ?? 0,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height,
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? MediaQuery.of(context).size.width,
        ),
        child: Ink(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: isBackground ? backgroundColor : Colors.transparent,
            borderRadius: borderRadius ??
                BorderRadius.all(Radius.circular(borderRadiusCircular)),
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
