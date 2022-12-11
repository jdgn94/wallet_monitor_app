import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/home/home_calendar.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorScheme = ColorSchemaApp();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.home),
        ),
        drawer: AppDrawer(
          routeSelect: 'home',
        ),
        body: Column(
          children: [
            HomeCalendarWidget(),
          ],
        ),
        bottomNavigationBar: _bottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
              color: colorScheme.primary,
            ),
            padding: const EdgeInsets.all(16.0),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * .15,
        height: 50.0,
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  BottomAppBar _bottomAppBar() {
    if (isReadyToDraw) {
      return BottomAppBar(
        child: Container(),
      );
    }

    return BottomAppBar(
      notchMargin: 6.0,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        StadiumBorder(
            side: BorderSide(
          width: 10.0,
          color: Colors.red,
          style: BorderStyle.solid,
        )),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomAction(Icons.history),
          _bottomAction(Icons.pie_chart),
          const SizedBox(width: 48.0),
          _bottomAction(Icons.wallet),
          _bottomAction(Icons.settings),
        ],
      ),
    );
  }
}
