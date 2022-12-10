import 'package:flutter/material.dart';
// -----------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
// -----------------------------
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/settings/settings_bloc.dart';
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';

class SettingsThemeWidget extends StatefulWidget {
  const SettingsThemeWidget({Key? key}) : super(key: key);

  @override
  State<SettingsThemeWidget> createState() => _SettingsThemeWidgetState();
}

class _SettingsThemeWidgetState extends State<SettingsThemeWidget> {
  final colorSchema = ColorSchemaApp();
  final SharedPreferences pref = SettingsLocalStorage.pref;
  late String _themeSelected;

  @override
  void initState() {
    super.initState();
    _themeSelected = pref.getString('theme') ?? 'system';
  }

  void changeTheme(BuildContext context, String theme) {
    BlocProvider.of<SettingsBloc>(context).add(ChangeTheme(theme));

    setState(() {
      _themeSelected = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.current.theme, style: const TextStyle(fontSize: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageButton(
              context,
              'assets/images/system_theme.png',
              S.current.system,
              'system',
              _themeSelected == 'system',
            ),
            imageButton(
              context,
              'assets/images/light_theme.png',
              S.current.light,
              'light',
              _themeSelected == 'light',
            ),
            imageButton(
              context,
              'assets/images/dark_theme.png',
              S.current.dark,
              'dark',
              _themeSelected == 'dark',
            ),
          ],
        ),
      ],
    );
  }

  Widget imageButton(
    BuildContext context,
    String imageRoute,
    String title,
    String value,
    bool active,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: active ? colorSchema.primary : Colors.transparent,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        onTap: () => changeTheme(context, value),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage(imageRoute),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
