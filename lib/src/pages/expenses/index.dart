import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/expenses/calendar.dart';
import 'package:wallet_monitor/src/widgets/app_bar_global.dart';

class ExpensesPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ExpensesPage({super.key, required this.scaffoldKey});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        title: S.current.expenses,
        route: 'exoenses',
        scaffoldKey: widget.scaffoldKey,
      ),
      body: ExpensesCalendarWidget(),
    );
  }
}
