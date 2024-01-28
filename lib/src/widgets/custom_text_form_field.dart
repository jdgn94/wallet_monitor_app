import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final EdgeInsets? margin;
  final int maxLines;
  final Color? shadowColor;
  final bool error;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.margin,
    this.maxLines = 1,
    this.shadowColor,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          StylesHelper.boxShadow(
            context,
            shadowColor: focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : error
                    ? AlertColors.error
                    : shadowColor,
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
