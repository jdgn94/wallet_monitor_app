// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_monitor/generated/l10n.dart';

import 'package:wallet_monitor/src/db/query/currency.query.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_button.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_text_form_field.dart';

Future<void> showDialogCurrencies(
  BuildContext context,
  Function(CurrencyModel) changeCurrency, {
  int? currencySelect,
}) async {
  final allCurrencies = await CurrencyQuery.getAll();
  FocusNode searchFocus = FocusNode();
  TextEditingController searchController = TextEditingController();
  CurrencyModel currencySelectDialog =
      allCurrencies.where((currency) => currency.id == currencySelect).first;
  List<CurrencyModel> currenciesFilter = allCurrencies;

  void closeDialog() {
    searchController.dispose();
    searchFocus.dispose();
  }

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        searchController.addListener(() {
          currenciesFilter = allCurrencies.where((currency) {
            final text = RegExp(searchController.text.toLowerCase());

            if (text.hasMatch(currency.name.toLowerCase()) ||
                text.hasMatch(currency.code.toLowerCase())) {
              return true;
            }
            return false;
          }).toList();
          setState(() {});
        });

        void selectCurrency(CurrencyModel currency) {
          setState(() {
            currencySelectDialog = currency;
          });
        }

        void confirmCurrency() {
          changeCurrency(currencySelectDialog);
          Navigator.of(context).pop();
        }

        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 500,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundTone(
                context,
                Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Column(
              children: [
                if (MediaQuery.of(context).size.height > 500)
                  _searchBar(searchFocus, searchController),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: currenciesFilter
                          .map((currency) => _currencyItem(
                                context,
                                currency,
                                currencySelectDialog,
                                selectCurrency,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                _actions(context, confirmCurrency),
              ],
            ),
          ),
        );
      });
    },
  ).then((value) => closeDialog());
}

CustomTextFormField _searchBar(
    FocusNode focusNode, TextEditingController controller) {
  return CustomTextFormField(
    controller: controller,
    focusNode: focusNode,
    margin: const EdgeInsets.all(10.0),
    label: "${S.current.search}...",
    prefixIcon: Icons.search_rounded,
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
    width: 90,
    height: 105,
    padding: const EdgeInsets.all(5.0),
    onTap: () => selectCurrency(currency),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
}

Padding _actions(BuildContext context, Function() confirmCurrency) {
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
          onTap: confirmCurrency,
          type: CustomButtonType.text,
          text: S.current.confirm,
          size: 15,
        ),
      ],
    ),
  );
}
