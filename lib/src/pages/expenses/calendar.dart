import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/date/date_bloc.dart';
import 'package:wallet_monitor/src/pages/expenses/graph.dart';
import 'package:wallet_monitor/src/pages/expenses/history.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/app_bar_global.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';

class ExpensesCalendarWidget extends StatefulWidget {
  const ExpensesCalendarWidget({super.key});

  @override
  State<ExpensesCalendarWidget> createState() => _ExpensesCalendarWidgetState();
}

class _ExpensesCalendarWidgetState extends State<ExpensesCalendarWidget> {
  final colorSchema = ColorSchemaApp();
  late double _currentPage;
  late PageController _pageController;

  @override
  void initState() {
    final month = DateBloc().state.month;
    super.initState();
    _pageController = PageController(initialPage: month - 1);
    _pageController.addListener(onChangePage);
    _currentPage = month - 1;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onChangePage() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _selector(),
        ),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _expenses(),
        ),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _graph(),
        ),
        Expanded(child: _history()),
      ],
    );
  }

  Widget _selector() {
    return SizedBox(
      height: 30.0,
      child: Stack(
        children: [
          PageView(
            pageSnapping: true,
            allowImplicitScrolling: true,
            controller: _pageController,
            children: [
              monthSelector(S.current.jan),
              monthSelector(S.current.feb),
              monthSelector(S.current.mar),
              monthSelector(S.current.apr),
              monthSelector(S.current.may),
              monthSelector(S.current.jun),
              monthSelector(S.current.jul),
              monthSelector(S.current.aug),
              monthSelector(S.current.sep),
              monthSelector(S.current.oct),
              monthSelector(S.current.nov),
              monthSelector(S.current.dic),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButtonGlobal(
                icon: getIcon('previousPage'),
                size: const Size(40.0, 15.0),
                callback: previousPage,
                textColor: colorSchema.primary,
                disabledButton: _currentPage <= 0,
              ),
              TextButtonGlobal(
                icon: getIcon('nextPage'),
                size: const Size(40.0, 15.0),
                callback: nextPage,
                textColor: colorSchema.primary,
                disabledButton: _currentPage >= 11,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget monthSelector(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _expenses() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: const [
          Text(
            "\$2361,41",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
          ),
          Text(
            "total expenses",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _graph() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 270.0,
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(8.0),
      child: const ExpensesGraphWidget(),
    );
  }

  Widget _history() {
    return const ExpensesHistoryWidget();
  }
}
