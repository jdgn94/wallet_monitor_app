import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final EdgeInsets margin;
  final int maxLines;
  final Color? shadowColor;
  final bool error;
  final bool readOnly;
  final FocusNode? focusNode;
  final IconData? suffixIcon;
  final Function()? onTap;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.margin = const EdgeInsets.all(10.0),
    this.maxLines = 1,
    this.shadowColor,
    this.error = false,
    this.readOnly = false,
    this.focusNode,
    this.suffixIcon,
    this.onTap,
  });

  Color? _shadowColor(BuildContext context) {
    if (error) {
      return AlertColors.error;
    }
    if (focusNode != null && focusNode!.hasFocus) {
      return Theme.of(context).colorScheme.primary;
    }
    return shadowColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          StylesHelper.boxShadow(
            context,
            shadowColor: _shadowColor(context),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        focusNode: focusNode,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        ),
      ),
    );
  }
}
