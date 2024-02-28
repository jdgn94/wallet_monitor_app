import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/animation.helper.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final double? expandedHeight;
  final double? toolbarHeight;
  final BoxDecoration? boxDecoration;
  final Color? backgroundColor;
  final bool pinned;
  final Widget child;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.child,
    this.backgroundColor,
    this.expandedHeight,
    this.toolbarHeight,
    this.boxDecoration,
    this.pinned = true,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late double _expandedHeight;
  late double _toolbarHeight;

  double calculateExpandRatio(BoxConstraints constraints) {
    double expandRatio = (constraints.maxHeight - _toolbarHeight) /
        (_expandedHeight - _toolbarHeight);

    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: headerSilverBuilder,
      body: Padding(
        padding: EdgeInsets.only(
            top:
                (widget.pinned ? (widget.toolbarHeight ?? kToolbarHeight) : 0) +
                    30),
        child: widget.child,
      ),
    );
  }

  List<Widget> headerSilverBuilder(context, innerBoxIsScrolled) {
    _expandedHeight =
        widget.expandedHeight ?? MediaQuery.of(context).size.height * 2 / 12;
    _toolbarHeight = widget.toolbarHeight ?? kToolbarHeight;

    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0),
          pinned: widget.pinned,
          expandedHeight: _expandedHeight,
          toolbarHeight: _toolbarHeight,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final expandRatio = calculateExpandRatio(constraints);
              final animation = AlwaysStoppedAnimation(expandRatio);

              return Stack(
                children: [
                  // background color
                  if (widget.pinned) _background(animation),

                  // Container nav bar
                  _headerContainer(animation, constraints),
                ],
              );
            },
          ),
        ),
      ),
    ];
  }

  FadeAnimationOpacityHelper _background(
      AlwaysStoppedAnimation<double> animation) {
    return FadeAnimationOpacityHelper(
      animation: animation,
      isExpandedWidget: true,
      begin: 1.0,
      end: 0.0,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              StylesHelper.boxShadow(context),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: (widget.backgroundColor ??
                      Theme.of(context).colorScheme.primary)
                  .withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            // child: widget.expandedWidget!,
          ),
        ),
      ),
    );
  }

  Stack _headerContainer(
    AlwaysStoppedAnimation<double> animation,
    BoxConstraints constraints,
  ) {
    return Stack(
      children: [
        _text(animation, constraints),
      ],
    );
  }

  PositionedAnimationHelper _text(
    AlwaysStoppedAnimation<double> animation,
    BoxConstraints constraints,
  ) {
    final textColor = Theme.of(context).colorScheme.onBackground;
    final size = constraints.biggest;
    final initPosition = RelativeRect.fromSize(
      Rect.fromLTWH(12, size.height - 40, size.width, 40),
      size,
    );
    final endPosition = RelativeRect.fromSize(
      Rect.fromLTWH((size.width / 2) - (widget.title.length / 2) * 15,
          size.height - 50, size.width, 50),
      size,
    );
    final initStyle = TextStyle(
      fontSize: 20,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
    final endStyle = TextStyle(
      fontSize: 30,
      color: textColor,
      fontWeight: FontWeight.bold,
    );

    return PositionedAnimationHelper(
      animation: animation,
      isExpandedWidget: true,
      initPosition: initPosition,
      endPosition: endPosition,
      child: TextStyleAnimationHelper(
        animation: animation,
        isExpandedWidget: true,
        initStyle: initStyle,
        endStyle: endStyle,
        text: widget.title,
      ),
    );
  }
}
