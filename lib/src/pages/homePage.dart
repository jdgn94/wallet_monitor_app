import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/widgets/textButton.dart';

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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(),
            Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonGlobal(
                    text: S.current.logOut,
                    icon: Icons.logout_outlined,
                    size: const Size(110.0, 35.0),
                    callback: () => redirect("/log_in"),
                  ),
                  TextButtonGlobal(
                    text: S.current.settings,
                    icon: Icons.settings,
                    size: const Size(110.0, 35.0),
                    callback: () => redirect("/settings"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
