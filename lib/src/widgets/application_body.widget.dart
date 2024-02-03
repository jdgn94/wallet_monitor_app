import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/widgets/custom_app_bar.widget.dart';

class ApplicationBodyWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const ApplicationBodyWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Ink(
          color: Theme.of(context).colorScheme.primary.withOpacity(.1),
          child: CustomAppBar(
            title: title,
            child: child,
          ),
        ),
      ),
    );
  }
}
