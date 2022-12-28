import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:rect_getter/rect_getter.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/currencies/index.dart';
import 'package:wallet_monitor/src/pages/expenses/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/floating_action_button_global.dart';

class HomePage extends StatefulWidget {
  final int initialPage;
  const HomePage({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final globalKey = RectGetter.createGlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final colorSchema = ColorSchemaApp();
  late Rect buttonRect;
  late PageController _pageController;
  late double _currentPage;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _pageController.addListener(onChangePage);
    _currentPage = widget.initialPage.toDouble();
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onChangePage() {
    print(_pageController.page!);
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void redirect(String route) {
    if (route != "log_in") {
      Navigator.pop(context);
      Navigator.pushNamed(context, route);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
  }

  void _changeIndex(int index) {
    try {
      print("hola vale $index");
      _pageController.jumpToPage(index);
      // _pageController.animateToPage(
      //   index,
      //   duration: const Duration(seconds: 1),
      //   curve: Curves.easeInBack,
      // );
      print("llegue al final");
    } catch (e) {
      print("ocurrio un error");
      print(e);
    }
  }

  String _selectedRoute() {
    switch (_currentPage.toInt()) {
      case 0:
        return 'expenses';
      case 1:
        return 'profits';
      case 2:
        return 'currency';
      case 3:
        return 'bank';
      default:
        return 'none';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: _pages(),
      drawer: AppDrawer(routeSelect: _selectedRoute()),
      bottomNavigationBar: _bottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonGlobal(
        globalKey: globalKey,
        widgetBackground: HomePage(initialPage: _currentPage.toInt()),
        widgetToNavigate: _selectedRoute(),
      ),
    );
  }

  Widget _pages() {
    List<Widget> pages = [
      ExpensesPage(scaffoldKey: scaffoldKey),
      const Center(child: Text('ganancias')),
      CurrenciesPage(scaffoldKey: scaffoldKey),
      const Center(child: Text('bancos')),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: true,
        allowImplicitScrolling: true,
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }

  Widget _bottomAppBar(BuildContext context) {
    if (isReadyToDraw) {
      return BottomAppBar(
        child: Container(),
      );
    }

    return _bottomNavigationBarGlobal();
  }

  Widget _bottomNavigationBarGlobal() {
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
          _changeIndex(index);
        },
      ),
    );
  }
}
