// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/models/currency.model.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';

showKeyboard(
  BuildContext context,
  Function({required double value /* , CurrencyModel? currency */}) onConfirm, {
  CurrencyModel? defaultCurrency,
  Color? color,
  double defaultValue = 0.0,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final defaultValueString = defaultValue.toString();
      String currentIntValue =
          defaultValueString.substring(0, defaultValueString.indexOf("."));
      String currentDecimalValue =
          defaultValueString.substring(defaultValueString.indexOf(".") + 1);

      List<String> operations = [];
      return StatefulBuilder(
        builder: (context, setState) {
          void onChange(String value) {}

          return Ink(
            decoration: BoxDecoration(
              color: backgroundTone(context: context, color: color),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(27.0),
                topRight: Radius.circular(27.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  _title(defaultValue != null),
                  _input(
                    context,
                    double.parse("$currentIntValue.$currentDecimalValue"),
                    operations,
                  ),
                  // TODO: here is selected account and currency
                  Divider(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.1),
                  ),
                  _keyboard(context, onChange),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _title(bool editValue) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
    child: Text(
      editValue ? S.current.editAmount : S.current.addAmount,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _input(
  BuildContext context,
  double actualAmount,
  List<String> operations,
) {
  return Container(
    height: 40,
    width: MediaQuery.of(context).size.width,
    constraints: const BoxConstraints(
      maxWidth: 600,
    ),
    child: Column(
      children: [],
    ),
  );
}

Container _keyboard(BuildContext context, Function(String value) onChange) {
  final List<String> keyboard = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    'del',
    '+'
  ];

  return Container(
    height: 360,
    width: MediaQuery.of(context).size.width,
    constraints: const BoxConstraints(
      maxWidth: 600,
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceAround,
        children: keyboard.map((key) => _key(context, key)).toList(),
      ),
    ),
  );
}

Widget _key(BuildContext context, String key) {
  final color = _getShadowColor(context, key);

  return CustomContainerWidget(
    height: 66,
    width: MediaQuery.of(context).size.width * .25 - 25,
    margin: const EdgeInsets.all(7.0),
    boxConstraints: const BoxConstraints(maxWidth: 150 - 25),
    color: color.withOpacity(0.1),
    splashColor: color,
    shadowColor: color,
    onTap: () {},
    child: Center(child: Text(key)),
  );
}

Color _getShadowColor(BuildContext context, String key) {
  if (key == '+' || key == '-' || key == '*' || key == '/' || key == '.') {
    return DefaultColors.green;
  }
  if (key == 'del') {
    return DefaultColors.red;
  }

  return Theme.of(context).colorScheme.primary;
}
