import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/banks_page.dart';
import 'package:wallet_monitor/src/pages/currencies_page.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_page_transition.dart';
import 'package:wallet_monitor/src/util/icons.dart';

BottomAppBar bottomNavigationBarGlobal(BuildContext context, Widget widget) {
  final colorSchema = ColorSchemaApp();

  return BottomAppBar(
    notchMargin: 5.0,
    color: colorSchema.primary,
    shape: const AutomaticNotchedShape(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      StadiumBorder(),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _bottomAction(
          context,
          'expenses',
          S.current.expenses,
          null,
          widget,
        ),
        _bottomAction(
          context,
          'profits',
          S.current.profits,
          null,
          widget,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .2),
        _bottomAction(
          context,
          'currency',
          S.current.currency,
          const CurrenciesPage(),
          widget,
        ),
        _bottomAction(
          context,
          'bank',
          S.current.bank,
          const BanksPage(),
          widget,
        ),
      ],
    ),
  );
}

Widget _bottomAction(
  BuildContext context,
  String icon,
  String message,
  Widget? route,
  Widget widget,
) {
  return Tooltip(
    message: message,
    child: InkWell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * .2,
        height: 50.0,
        child: Hero(
          tag: icon,
          child: Icon(
            getIcon(icon),
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        if (route != null) {
          AppPageTransition page = AppPageTransition(
            background: widget,
            page: route,
          );
          Navigator.of(context).push(page);
        }
      },
    ),
  );
}
