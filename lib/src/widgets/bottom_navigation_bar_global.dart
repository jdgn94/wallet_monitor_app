import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/home_page.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';

class BottomNavigationBarGlobal extends StatefulWidget {
  final int indexSelected;
  final Function changeIndex;
  const BottomNavigationBarGlobal({
    super.key,
    required this.indexSelected,
    required this.changeIndex,
  });

  @override
  State<BottomNavigationBarGlobal> createState() =>
      _BottomNavigationBarGlobalState();
}

class _BottomNavigationBarGlobalState extends State<BottomNavigationBarGlobal> {
  final colorSchema = ColorSchemaApp();

  @override
  Widget build(BuildContext context) {
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
            0,
          ),
          _bottomAction(
            context,
            'profits',
            S.current.profits,
            1,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .2),
          _bottomAction(
            context,
            'currency',
            S.current.currency,
            2,
          ),
          _bottomAction(
            context,
            'bank',
            S.current.bank,
            3,
          ),
        ],
      ),
    );
  }

  Widget _bottomAction(
      BuildContext context, String icon, String message, int index) {
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
          widget.changeIndex(index);
        },
      ),
    );
  }
}
