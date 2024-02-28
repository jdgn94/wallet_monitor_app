import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_icon.widget.dart';

class IconSelectorWidget extends StatefulWidget {
  const IconSelectorWidget({super.key});

  @override
  State<IconSelectorWidget> createState() => _IconSelectorWidgetState();
}

class _IconSelectorWidgetState extends State<IconSelectorWidget> {
  final List<String> iconsStyles = ["-linear", "-color", ""];
  SharedPreferences pref = SettingsLocalStorage.configPref;
  late String styleSelected;

  @override
  void initState() {
    styleSelected = pref.getString("categoryIcon") ?? "";
    super.initState();
  }

  void _changeIconStyle(String style) {
    pref.setString("categoryIcon", style);

    setState(() {
      styleSelected = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconsStyles
          .map(
            (style) => CustomContainerWidget(
              onTap: () => _changeIconStyle(style),
              padding: const EdgeInsets.all(15.0),
              splashColor: Theme.of(context).colorScheme.primary,
              shadowColor: styleSelected == style
                  ? Theme.of(context).colorScheme.primary
                  : null,
              child: CustomIconWidget(
                categoryIcon: categoryIconFromStringList(
                  ["geometric"],
                  "other",
                  forceIconType: style,
                )[0],
                size: 50,
              ),
            ),
          )
          .toList(),
    );
  }
}
