// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/models/currency.model.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_button.widget.dart';
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
      bool decimalWrite = false;
      List<String> operations = [];

      return StatefulBuilder(
        builder: (context, setState) {
          void onChange(String value) {
            if (value == ".") {
              decimalWrite = true;
            } else if (value == "del") {
              if (decimalWrite) {
                currentDecimalValue = currentDecimalValue.length > 1
                    ? currentDecimalValue.substring(
                        0,
                        currentDecimalValue.length - 1,
                      )
                    : "0";
                if (currentDecimalValue == "0") decimalWrite = false;
              } else {
                currentIntValue = currentIntValue.length > 1
                    ? currentIntValue.substring(0, currentIntValue.length - 1)
                    : "0";
              }
            } else if (value == "+" ||
                value == "-" ||
                value == "*" ||
                value == "/") {
              if (operations.isEmpty) {
                operations.add('$currentIntValue.$currentDecimalValue');
                operations.add(value);
                currentIntValue = "0";
                currentDecimalValue = "0";
                decimalWrite = false;
              } else {
                var lastOperation = operations[operations.length - 1];
                if (lastOperation == "*" ||
                    lastOperation == "/" ||
                    lastOperation == "+" ||
                    lastOperation == "-") {
                  if (currentIntValue == "0" && currentDecimalValue == "0") {
                    operations[operations.length - 1] = value;
                  } else {
                    operations.add('$currentIntValue.$currentDecimalValue');
                    operations.add(value);
                    currentIntValue = "0";
                    currentDecimalValue = "0";
                    decimalWrite = false;
                  }
                }
              }
            } else {
              if (decimalWrite) {
                if (currentDecimalValue == "0") {
                  currentDecimalValue = value;
                } else {
                  currentDecimalValue = currentDecimalValue + value;
                }
              } else {
                if (currentIntValue == "0") {
                  currentIntValue = value;
                } else {
                  currentIntValue = currentIntValue + value;
                }
              }
            }
            setState(() {});
          }

          void clear() {
            setState(() {
              operations = [];
              currentIntValue = "0";
              currentDecimalValue = "0";
              decimalWrite = false;
            });
          }

          return Ink(
            decoration: BoxDecoration(
              color: backgroundTone(context: context, color: color),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                _title(defaultValue != null),
                _input(
                  context,
                  defaultCurrency,
                  double.parse("$currentIntValue.$currentDecimalValue"),
                  operations,
                ),
                // TODO: here is selected account and currency
                _keyboard(context, onChange, clear),
                _confirmAmount(context),
                SizedBox(height: 10),
              ],
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
  CurrencyModel? currency,
  double actualAmount,
  List<String> operations,
) {
  return Container(
    height: 40,
    width: MediaQuery.of(context).size.width,
    constraints: const BoxConstraints(
      maxWidth: 600,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "${currency?.symbol}\t$actualAmount",
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    ),
  );
}

Container _keyboard(
  BuildContext context,
  Function(String value) onChange,
  Function() clear,
) {
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
      child: CustomContainerWidget(
        shadowColor: Colors.transparent,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.3),
        ),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.spaceAround,
          children: keyboard
              .map((key) => _key(context, key, onChange, clear))
              .toList(),
        ),
      ),
    ),
  );
}

Widget _key(
  BuildContext context,
  String key,
  Function(String) onChange,
  Function() clear,
) {
  final color = _getShadowColor(context, key);

  return CustomContainerWidget(
    height: 66,
    width: MediaQuery.of(context).size.width * .25 - 30,
    margin: const EdgeInsets.all(5.0),
    boxConstraints: const BoxConstraints(maxWidth: 150 - 30),
    color: color.withOpacity(0.1),
    splashColor: color,
    shadowColor: color,
    onTap: () => onChange(key),
    onLongPress: key == "del" ? clear : null,
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

Widget _confirmAmount(BuildContext context) {
  return CustomButtonWidget(
    text: S.current.confirmAmount,
    width: MediaQuery.of(context).size.width - 20,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    fontSize: 20,
    centerText: true,
  );
}
