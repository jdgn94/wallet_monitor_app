import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:wallet_monitor/src/pages/add_expense_page.dart';
import 'package:wallet_monitor/src/pages/currencies/add_currency.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_page_transition.dart';

import '../util/icons.dart';
import 'button_global.dart';

class FloatingActionButtonGlobal extends StatelessWidget {
  final GlobalKey<RectGetterState> globalKey;
  final Widget widgetBackground;
  final String widgetToNavigate;
  final colorSchema = ColorSchemaApp();

  FloatingActionButtonGlobal({
    super.key,
    required this.globalKey,
    required this.widgetBackground,
    required this.widgetToNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return RectGetter(
      key: globalKey,
      child: ButtonGlobal(
        callback: () {
          final buttonRect = RectGetter.getRectFromKey(globalKey)!;

          AppPageTransition page = AppPageTransition(
            background: widgetBackground,
            page: _selectedNavigation(buttonRect),
          );

          Navigator.of(context).push(page);
        },
        icon: getIcon('add'),
        backgroundColor: colorSchema.primary,
        textColor: Colors.white,
        size: Size(MediaQuery.of(context).size.width * .2 - 10, 40.0),
      ),
    );
  }

  Widget _selectedNavigation(Rect buttonRect) {
    print(widgetToNavigate);
    switch (widgetToNavigate) {
      case 'expenses':
        return AddExpensePage(buttonRect: buttonRect);
      case 'profits':
        return AddExpensePage(buttonRect: buttonRect);
      case 'currency':
        return AddCurrency(buttonRect: buttonRect);
      default:
        return const _PageNoFound();
    }
  }
}

class _PageNoFound extends StatelessWidget {
  const _PageNoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}
