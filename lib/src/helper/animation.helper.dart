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

class FadeAnimationTextAppBarHelper extends StatelessWidget {
  final Animation<double> animation;
  final bool isExpandedWidget;
  final double? begin;
  final double? end;
  final Widget child;

  const FadeAnimationTextAppBarHelper({
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
