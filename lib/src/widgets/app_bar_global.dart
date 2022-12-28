import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String route;
  final String? icon;
  final List<Widget>? actions;
  final bool showScaffold;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final colorSchema = ColorSchemaApp();

  AppBarGlobal({
    super.key,
    required this.title,
    required this.route,
    required this.scaffoldKey,
    this.icon,
    this.actions,
    this.showScaffold = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          getIcon(icon ?? (showScaffold ? 'menu' : 'back')),
          color: Colors.white,
        ),
        onPressed: () {
          if (showScaffold) {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
            return;
          }

          Navigator.of(context).pop();
        },
      ),
      title: Text(title),
      actions: actions,
      backgroundColor: colorSchema.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0),
        ),
      ),
    );
  }
}
