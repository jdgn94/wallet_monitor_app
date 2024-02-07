import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_button.widget.dart';

showDialogColorSelector(
  BuildContext context,
  Function(Color) changeColor,
  Color defaultColor,
) {
  final List<Color> colorList = [
    DefaultColors.pink,
    DefaultColors.red,
    DefaultColors.deepOrange,
    DefaultColors.orange,
    DefaultColors.amber,
    DefaultColors.yellow,
    DefaultColors.lime,
    DefaultColors.lightGreen,
    DefaultColors.green,
    DefaultColors.teal,
    DefaultColors.cyan,
    DefaultColors.lightBlue,
    DefaultColors.blue,
    DefaultColors.indigo,
    DefaultColors.purple,
    DefaultColors.deepPurple,
    DefaultColors.blueGray,
    DefaultColors.brown,
    DefaultColors.grey,
  ];

  Color colorSelected = defaultColor;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        void selectColor(Color color) {
          setState(() {
            colorSelected = color;
          });
        }

        void confirmColor() {
          changeColor(colorSelected);
          Navigator.of(context).pop();
        }

        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundTone(
                context: context,
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: colorList
                        .map((color) => _colorListSelector(
                              context,
                              color,
                              colorSelected,
                              selectColor,
                            ))
                        .toList(),
                  ),
                ),
                _actions(context, confirmColor)
              ],
            ),
          ),
        );
      });
    },
  );
}

Padding _colorListSelector(
  BuildContext context,
  Color color,
  Color colorSelected,
  Function(Color) selectColor,
) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: InkWell(
      onTap: () => selectColor(color),
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 1.0,
          ),
        ),
        child: Center(
          child: color == colorSelected ? const Icon(Icons.check) : null,
        ),
      ),
    ),
  );
}

Padding _actions(BuildContext context, Function() confirmColor) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButtonWidget(
          margin: const EdgeInsets.only(left: 10.0),
          onTap: () => Navigator.of(context).pop(),
          type: CustomButtonType.text,
          text: S.current.cancel,
          size: 15,
        ),
        CustomButtonWidget(
          margin: const EdgeInsets.only(left: 10.0),
          onTap: confirmColor,
          type: CustomButtonType.text,
          text: S.current.confirm,
          size: 15,
        ),
      ],
    ),
  );
}
