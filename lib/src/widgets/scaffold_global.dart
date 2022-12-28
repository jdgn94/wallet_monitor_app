import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:rect_getter/rect_getter.dart';

import 'package:wallet_monitor/src/util/app_drawer.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/bottom_navigation_bar_global.dart';

import 'package:wallet_monitor/src/widgets/floating_action_button_global.dart';

class ScaffoldGlobal extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final String routeSelect;
  final Widget? body;
  final Widget widgetBackground;
  final String iconMenu;

  const ScaffoldGlobal({
    super.key,
    required this.scaffoldKey,
    this.appBarTitle,
    this.appBarActions,
    required this.routeSelect,
    this.body,
    required this.widgetBackground,
    this.iconMenu = 'menu',
  });

  @override
  State<ScaffoldGlobal> createState() => _ScaffoldGlobalState();
}

class _ScaffoldGlobalState extends State<ScaffoldGlobal> {
  final GlobalKey<RectGetterState> globalKey = RectGetter.createGlobalKey();

  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) {
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (widget.scaffoldKey.currentState!.isDrawerOpen) {
              widget.scaffoldKey.currentState!.closeDrawer();
            } else {
              widget.scaffoldKey.currentState!.openDrawer();
            }
          },
          icon: Icon(getIcon(widget.iconMenu), color: Colors.white),
        ),
        title: Text(widget.appBarTitle ?? 'No title'),
        actions: widget.appBarActions,
      ),
      drawer: AppDrawer(routeSelect: widget.routeSelect),
      body: widget.body,
      // bottomNavigationBar: _bottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonGlobal(
        globalKey: globalKey,
        widgetBackground: widget.widgetBackground,
        widgetToNavigate: widget.routeSelect,
      ),
    );
  }

  // Widget _bottomAppBar(BuildContext context) {
  //   if (isReadyToDraw) {
  //     return BottomAppBar(
  //       child: Container(),
  //     );
  //   }

  //   return BottomNavigationBarGlobal(
  //     actualWidget: widget.widgetBackground,
  //     routeSelect: widget.routeSelect,
  //   );
  // }
}
