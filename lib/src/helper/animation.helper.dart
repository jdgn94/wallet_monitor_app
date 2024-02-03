import 'package:flutter/material.dart';

class FadeAnimationOpacityHelper extends StatelessWidget {
  final Animation<double> animation;
  final bool isExpandedWidget;
  final double? begin;
  final double? end;
  final Widget child;

  const FadeAnimationOpacityHelper({
    super.key,
    required this.animation,
    required this.isExpandedWidget,
    this.begin,
    this.end,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(
        begin: isExpandedWidget ? begin ?? 0.0 : end ?? 1.0,
        end: isExpandedWidget ? end ?? 1.0 : begin ?? 0.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            isExpandedWidget ? 0.5 : 0.2,
            isExpandedWidget ? 1.0 : 0.55,
          ),
        ),
      ),
      alwaysIncludeSemantics: true,
      child: child,
    );
  }
}

class TextStyleAnimationHelper extends StatelessWidget {
  final Animation<double> animation;
  final bool isExpandedWidget;
  final TextStyle? initStyle;
  final TextStyle? endStyle;
  final String text;

  const TextStyleAnimationHelper({
    super.key,
    required this.animation,
    required this.isExpandedWidget,
    required this.initStyle,
    required this.endStyle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyleTransition(
      style: TextStyleTween(
        begin: initStyle,
        end: endStyle,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            isExpandedWidget ? 0.5 : 0.2,
            isExpandedWidget ? 1.0 : 0.55,
          ),
        ),
      ),
      child: Text(text),
    );
  }
}

class PositionedAnimationHelper extends StatelessWidget {
  final Animation<double> animation;
  final bool isExpandedWidget;
  final RelativeRect initPosition;
  final RelativeRect endPosition;
  final Widget child;

  const PositionedAnimationHelper({
    super.key,
    required this.animation,
    required this.isExpandedWidget,
    required this.initPosition,
    required this.endPosition,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
      rect: RelativeRectTween(
        begin: initPosition,
        end: endPosition,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            isExpandedWidget ? 0.5 : 0.2,
            isExpandedWidget ? 1.0 : 0.55,
          ),
        ),
      ),
      child: child,
    );
  }
}
