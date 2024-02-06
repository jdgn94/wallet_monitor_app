import 'package:flutter/material.dart';

class KeyboardBottomSheet extends StatefulWidget {
  const KeyboardBottomSheet({super.key});

  @override
  State<KeyboardBottomSheet> createState() => _KeyboardBottomSheetState();
}

class _KeyboardBottomSheetState extends State<KeyboardBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _bottomSheetController;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(vsync: this);
    _openButtonSheet();
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  void _openButtonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          animationController: _bottomSheetController,
          enableDrag: true,
          onClosing: () {},
          builder: (BuildContext context) {
            return Text("Hola");
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
