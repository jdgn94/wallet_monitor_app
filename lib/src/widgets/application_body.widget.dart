import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_app_bar.widget.dart';

class ApplicationBodyWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? color;

  const ApplicationBodyWidget({
    super.key,
    required this.title,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Ink(
          color: backgroundTone(
            context,
            color ?? Theme.of(context).colorScheme.primary,
          ),
          child: CustomAppBar(
            title: title,
            backgroundColor: color ?? Theme.of(context).colorScheme.primary,
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
