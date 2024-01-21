import 'package:flutter/material.dart';

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
  Container build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Ink(
          width: width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: wrapCrossAlignment,
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
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
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
