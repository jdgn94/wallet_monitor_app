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
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final String? prefix;
  final String? suffix;
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
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.prefix,
    this.suffix,
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

  SizedBox? _title(String? text) {
    if (text != null) {
      return SizedBox(
        width: 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      );
    }
    return null;
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
        keyboardType: textInputType,
        textCapitalization: TextCapitalization.sentences,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : _title(suffix),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : _title(prefix),
        ),
      ),
    );
  }
}
