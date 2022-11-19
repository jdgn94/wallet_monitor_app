import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final List<Widget> components;
  final String title;
  final double titleFontSize;
  final double height;

  const BoxContainer({
    super.key,
    required this.components,
    this.title = "",
    this.titleFontSize = 30.0,
    this.height = 300.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: Theme.of(context).colorScheme.background.withAlpha(90),
      ),
      constraints: const BoxConstraints(maxWidth: 700),
      width: MediaQuery.of(context).size.width - 100.0,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [if (title != "") boxTitle(), ...components],
      ),
    );
  }

  Text boxTitle() {
    return Text(
      title,
      style: TextStyle(
        fontSize: titleFontSize,
      ),
    );
  }
}
