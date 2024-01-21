import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/fade_animation.helper.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final double? expandedHeight;
  final double? toolbarHeight;
  final BoxDecoration? boxDecoration;
  final bool pinned;
  final Widget child;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.child,
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
      body: widget.child,
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
          backgroundColor: Theme.of(context).colorScheme.background,
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
                  if (widget.pinned) _background(animation, context),

                  // Text from navbar
                  _text(),
                ],
              );
            },
          ),
        ),
      ),
    ];
  }

  FadeAnimationOpacityHelper _background(
      AlwaysStoppedAnimation<double> animation, BuildContext context) {
    return FadeAnimationOpacityHelper(
      animation: animation,
      isExpandedWidget: true,
      begin: 1.0,
      end: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        // child: widget.expandedWidget!,
      ),
    );
  }

  Column _text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 25,
              overflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container();
  }
}
