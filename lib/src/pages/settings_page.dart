import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/src/bloc/settings/settings_bloc.dart';
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/util/app_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Map<String, String>> _themeConfigs = [
    {"value": "system", "text": "System"},
    {"value": "light", "text": "Light"},
    {"value": "dark", "text": "Dark"},
  ];
  late SharedPreferences prefs = SettingsLocalStorage.prefs;
  late String _themeValue;

  @override
  void initState() {
    super.initState();
    _themeValue = prefs.getString('theme') ?? 'system';
  }

  Map<String, String> getDropdownValue() {
    if (_themeValue == 'light') return _themeConfigs[1];
    if (_themeValue == 'dark') return _themeConfigs.last;
    return _themeConfigs.first;
  }

  changeTheme(BuildContext context, Map<String, String>? newValue) {
    print(newValue);
    if (newValue == null) return;
    print("en la funcion para cambiar el tema");
    BlocProvider.of<SettingsBloc>(context)
        .add(ChangeTheme(newValue['value'] ?? 'system'));
    setState(() {
      _themeValue = newValue["value"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const AppDrawer(
          routeSelect: 'settings',
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton<Map<String, String>>(
                value: getDropdownValue(),
                icon: const Icon(Icons.arrow_downward),
                onChanged: (Map<String, String>? valueSelected) =>
                    changeTheme(context, valueSelected),
                items: _themeConfigs.map<DropdownMenuItem<Map<String, String>>>(
                  (Map<String, String> value) {
                    return DropdownMenuItem<Map<String, String>>(
                      value: value,
                      child: Text(value["text"] ?? ""),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
