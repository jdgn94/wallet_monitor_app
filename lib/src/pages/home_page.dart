import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:rect_getter/rect_getter.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/home/home_calendar.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';
import 'package:wallet_monitor/src/util/app_page_transition.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';

import 'add_expense.dart';

class HomePage extends StatefulWidget {
  final Rect? buttonPosition;
  const HomePage({Key? key, this.buttonPosition}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<RectGetterState> globalKey = RectGetter.createGlobalKey();
  final colorScheme = ColorSchemaApp();
  late Rect buttonRect;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 100)).then((v) {
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );
  }

  void redirect(String route) {
    if (route != "log_in") {
      Navigator.pop(context);
      Navigator.pushNamed(context, route);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
  }

  void _openCalendar() {
    AppDialog.buildMessageDialog(
      context,
      _calendar(),
      null,
      null,
      null,
      null,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.home),
        actions: _appBarActions(),
      ),
      drawer: AppDrawer(
        routeSelect: 'home',
      ),
      body: Column(
        children: [
          HomeCalendarWidget(),
        ],
      ),
      bottomNavigationBar: _bottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RectGetter(
        key: globalKey,
        child: ButtonGlobal(
          callback: () {
            buttonRect = RectGetter.getRectFromKey(globalKey)!;

            AppPageTransition page = AppPageTransition(
              background: widget,
              page: AddExpensePage(buttonRect: buttonRect),
            );

            Navigator.of(context).push(page);
            // final args =
            //     '${buttonRect.left},${buttonRect.top},${buttonRect.right},${buttonRect.bottom}';
            // Navigator.pushNamed(context, '/add_expense', arguments: args);
          },
          icon: getIcon('add'),
          backgroundColor: colorScheme.primary,
          textColor: Colors.white,
          size: Size(MediaQuery.of(context).size.width * .2 - 10, 40.0),
        ),
      ),
    );
  }

  List<Widget> _appBarActions() {
    return [
      InkWell(
        onTap: () => _openCalendar(),
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        child: Ink(
          width: 60.0,
          height: 60.0,
          child: Icon(getIcon('calendar')),
        ),
      ),
    ];
  }

  Widget _bottomAction(IconData icon, String message, String? route) {
    return Tooltip(
      message: message,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * .2,
          height: 50.0,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        onTap: () {
          if (route != null) {
            Navigator.pushNamed(context, '/$route');
          }
        },
      ),
    );
  }

  BottomAppBar _bottomAppBar(BuildContext context) {
    if (isReadyToDraw) {
      return BottomAppBar(
        child: Container(),
      );
    }

    return BottomAppBar(
      notchMargin: 5.0,
      color: colorScheme.primary,
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
          _bottomAction(getIcon('history'), S.current.history, null),
          _bottomAction(getIcon('currency'), S.current.currency, null),
          SizedBox(width: MediaQuery.of(context).size.width * .2),
          _bottomAction(getIcon('bank'), S.current.bank, null),
          _bottomAction(getIcon('settings'), S.current.settings, 'settings'),
        ],
      ),
    );
  }

  Widget _calendar() {
    return Container(
      width: 300,
      height: 300,
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime.now(),
        onDateChanged: (date) {},
      ),
    );
  }
}
