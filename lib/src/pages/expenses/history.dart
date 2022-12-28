import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/models/card_value.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';

class ExpensesHistoryWidget extends StatefulWidget {
  const ExpensesHistoryWidget({super.key});

  @override
  State<ExpensesHistoryWidget> createState() => _ExpensesHistoryWidgetState();
}

class _ExpensesHistoryWidgetState extends State<ExpensesHistoryWidget> {
  final colorSchema = ColorSchemaApp();
  List<int> cardSelects = [];
  final List<CardValue> _cardValues = [
    CardValue(
      title: "Shopping",
      moneyDenomination: "\$",
      amount: 300.0,
      category: "shopping",
    ),
    CardValue(
      title: "Food",
      moneyDenomination: "\$",
      amount: 215.25,
      category: "food",
    ),
    CardValue(
      title: "Games",
      moneyDenomination: "\$",
      amount: 160.2,
      category: "games",
    ),
    CardValue(
      title: "Entertainment",
      moneyDenomination: "\$",
      amount: 62.57,
      category: "entertainment",
    ),
    CardValue(
      title: "Gas",
      moneyDenomination: "\$",
      amount: 57.35,
      category: "gas",
    ),
    CardValue(
      title: "Parking",
      moneyDenomination: "\$",
      amount: 300.0,
      category: "parking",
    ),
  ];

  void _selectCard(int index) {
    if (_indexIsSelected(index)) {
      setState(() {
        cardSelects.removeWhere((element) => element == index);
      });
      return;
    }

    setState(() {
      cardSelects.add(index);
    });
    return;
  }

  bool _indexIsSelected(int index) {
    final indexInCard = cardSelects.indexOf(index);
    if (indexInCard == -1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(maxWidth: 600),
      child: ListView.separated(
        itemCount: _cardValues.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = _cardValues[index];
          return _cardHistory(item, index);
        },
      ),
    );
  }

  InkWell _cardHistory(CardValue item, int index) {
    return InkWell(
      onTap: () => _selectCard(index),
      onLongPress: () {
        print(
            'open modal to view all transactions with this category in this month');
      },
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      splashColor: colorSchema.primary.withOpacity(0.5),
      child: Ink(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: _colorSelector(context, index),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  getIcon(item.category),
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      item.subtitle ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: colorSchema.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  '${item.moneyDenomination} ${item.amount}',
                  style: TextStyle(
                    color: colorSchema.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorSelector(BuildContext context, int index) {
    if (Theme.of(context).colorScheme.brightness == Brightness.dark) {
      if (_indexIsSelected(index)) {
        return colorSchema.primaryDark.withOpacity(0.4);
      }
      return Colors.grey.shade900;
    }

    if (_indexIsSelected(index)) {
      return colorSchema.primaryLight.withOpacity(0.4);
    }
    return Colors.grey.shade200;
  }
}
