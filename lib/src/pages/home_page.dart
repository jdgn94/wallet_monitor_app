import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.home),
      ),
      drawer: AppDrawer(
        routeSelect: 'home',
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
