import 'package:flutter/material.dart';
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

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Theme.of(context).colorScheme.onBackground,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      currentIndex: _navBarIndex,
      onTap: _changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(getIcon("account")),
          label: S.current.accounts,
        ),
        BottomNavigationBarItem(
          icon: Icon(getIcon("transaction")),
          label: S.current.transactions,
        ),
        BottomNavigationBarItem(
          icon: Icon(getIcon("budgets")),
          label: S.current.budgets,
        ),
        BottomNavigationBarItem(
          icon: Icon(getIcon("more")),
          label: S.current.more,
        ),
      ],
    );
  }
}
