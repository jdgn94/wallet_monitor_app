import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_monitor/src/models/category_icon.model.dart';

export 'package:wallet_monitor/src/models/category_icon.model.dart';

class CustomIconWidget extends StatelessWidget {
  final CategoryIcon categoryIcon;
  final double size;
  const CustomIconWidget(
      {super.key, required this.categoryIcon, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      categoryIcon.url,
      width: size,
      height: size,
    );
  }
}
