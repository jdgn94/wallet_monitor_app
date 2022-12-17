import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/home/home_calendar.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';

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
        bottomNavigationBar: _bottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ButtonGlobal(
          callback: () {},
          icon: Icons.add,
          backgroundColor: colorScheme.primary,
          textColor: Colors.white,
          size: Size(MediaQuery.of(context).size.width * .2 - 10, 40.0),
        ),
      ),
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * .2,
        height: 50.0,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onTap: () {},
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
          _bottomAction(Icons.history),
          _bottomAction(Icons.pie_chart),
          SizedBox(
            width: MediaQuery.of(context).size.width * .2,
          ),
          _bottomAction(Icons.wallet),
          _bottomAction(Icons.settings),
        ],
      ),
    );
  }
}
