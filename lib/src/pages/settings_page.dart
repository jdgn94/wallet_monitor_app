import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/settings/settings_language.dart';
import 'package:wallet_monitor/src/pages/settings/settings_theme.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(S.current.settings),
        ),
        drawer: AppDrawer(
          routeSelect: 'settings',
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const [
                SettingsThemeWidget(),
                SettingsLanguageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
