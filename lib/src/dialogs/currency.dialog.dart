// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/db/query/currency.query.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';

Future<void> showDialogCurrencies(
  BuildContext context, {
  int? currencySelect,
}) async {
  final allCurrencies = await CurrencyQuery.getAll();
  CurrencyModel currencySelectDialog =
      allCurrencies.where((currency) => currency.id == currencySelect).first;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        void _selectCurrency(CurrencyModel currency) {
          setState(() {
            currencySelectDialog = currency;
          });
        }

        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          contentPadding: EdgeInsets.zero,
          content: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 600,
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Column(
              children: [
                // TODO: currency search
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: allCurrencies
                          .map((currency) => _currencyItem(
                                context,
                                currency,
                                currencySelectDialog,
                                _selectCurrency,
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
    },
  );
}

CustomContainerWidget _currencyItem(
  BuildContext context,
  CurrencyModel currency,
  CurrencyModel currencySelected,
  Function(CurrencyModel) selectCurrency,
) {
  return CustomContainerWidget(
    margin: const EdgeInsets.all(10.0),
    color: currency == currencySelected
        ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
        : Theme.of(context).colorScheme.background,
    width: 100,
    height: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          currency.code,
          style: TextStyle(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
        ),
        Text(
          currency.symbol,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          currency.name,
          style: TextStyle(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
  // return Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: InkWell(
  //     child: Ink(
  //       width: 100,
  //       height: 80,
  //       decoration: BoxDecoration(
  //         color: currency == currencySelected
  //             ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
  //             : Theme.of(context).colorScheme.background,
  //         borderRadius: BorderRadius.circular(20.0),
  //       ),
  //       child: Column(
  //         children: [
  //           Text(
  //             currency.code,
  //             style: TextStyle(
  //                 color: Theme.of(context)
  //                     .colorScheme
  //                     .onBackground
  //                     .withOpacity(0.7)),
  //           ),
  //           Text(currency.symbol),
  //           Text(currency.name),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}
