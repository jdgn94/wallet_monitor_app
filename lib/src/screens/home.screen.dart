import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/screens/views/account.view.dart';
import 'package:wallet_monitor/src/settings/app_icons.settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _navBarIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(int page) {
    setState(() {
      _navBarIndex = page;
    });
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        AccountView(),
        Center(child: Text("transactions page")),
        Center(child: Text("budgets page")),
        Center(child: Text("more pages")),
      ],
    );
  }

  GNav _bottomNavigationBar() {
    return GNav(
      haptic: true,
      selectedIndex: _navBarIndex,
      onTabChange: _changePage,
      // tabActiveBorder: Border.all(
      //   color: Theme.of(context).colorScheme.primary,
      //   width: 1,
      // ),
      // curve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: 900),
      tabBackgroundColor:
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
      // tabShadow: [
      //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
      // ],
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      tabMargin: const EdgeInsets.symmetric(vertical: 10.0),
      iconSize: 24,
      gap: 8,
      tabs: [
        GButton(icon: getIcon("account"), text: S.current.accounts),
        GButton(icon: getIcon("transaction"), text: S.current.transactions),
        GButton(icon: getIcon("budgets"), text: S.current.budgets),
        GButton(icon: getIcon("more"), text: S.current.more),
      ],
    );
  }
}
