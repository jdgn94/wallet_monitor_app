import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';

class BoxWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String subtitle;
  final String note;
  final double? width;
  final WrapCrossAlignment wrapCrossAlignment;
  final Color? subtitleColor;

  const BoxWidget({
    super.key,
    this.onTap,
    this.title = "",
    this.subtitle = "",
    this.note = "",
    this.width,
    this.wrapCrossAlignment = WrapCrossAlignment.center,
    this.subtitleColor,
  });

  @override
  CustomContainerWidget build(BuildContext context) {
    return CustomContainerWidget(
      onTap: onTap,
      width: width,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: wrapCrossAlignment,
        runAlignment: WrapAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: subtitleColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            note,
            style: TextStyle(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
