// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/widgets/text_button.dart';

class AppDrawer extends StatelessWidget {
  final String routeSelect;
  final pref = SettingsLocalStorage.pref;
  AppDrawer({super.key, required this.routeSelect});

  Future<void> redirect(BuildContext context, String route) async {
    if (route != "/log_in") {
      Navigator.pop(context);
      Navigator.pushNamed(context, route);
      return;
    }

    await pref.remove('token');
    Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
    return;
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = ColorSchemaApp();
    return Drawer(
      child: Stack(
        children: [
          const BackgroundUtil(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 290.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 355.0,
                width: double.infinity,
                child: ListView(
                  children: [
                    listViewItem(
                      context,
                      redirect,
                      '/home',
                      S.current.home,
                      Icons.home_rounded,
                      routeSelect == 'home',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButtonGlobal(
                      text: S.current.logOut,
                      icon: Icons.logout_outlined,
                      size: const Size(110.0, 35.0),
                      callback: () => redirect(context, "/log_in"),
                    ),
                    TextButtonGlobal(
                      text: S.current.settings,
                      icon: Icons.settings,
                      size: const Size(110.0, 35.0),
                      disabledButton: routeSelect == 'settings',
                      textColor: routeSelect == 'settings'
                          ? colorSchema.primary
                          : null,
                      callback: () => redirect(context, "/settings"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listViewItem(BuildContext context, Function redirect, String route,
      String itemName, IconData icon, bool routeActive) {
    final colorSchema = ColorSchemaApp();
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: TextButtonGlobal(
        text: itemName,
        icon: icon,
        disabledButton: routeActive,
        textColor: routeActive ? colorSchema.primary : null,
        mainAxisAlignment: MainAxisAlignment.start,
        callback: () => redirect(context, route),
      ),
    );
  }
}
