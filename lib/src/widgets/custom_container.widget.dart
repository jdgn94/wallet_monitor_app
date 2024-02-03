import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';

class CustomContainerWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Function()? onTap;

  const CustomContainerWidget({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: margin,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.0),
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                StylesHelper.boxShadow(context, shadowColor: shadowColor),
              ],
            ),
            child: Ink(
              padding: padding,
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: color,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
