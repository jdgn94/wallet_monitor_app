import 'package:flutter/material.dart';

class AppPageTransition extends PageRouteBuilder {
  final Widget page;
  final Widget background;

  AppPageTransition({required this.page, required this.background})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) => Stack(
            children: [background, page],
          ),
        );
}
