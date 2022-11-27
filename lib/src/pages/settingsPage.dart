import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/bloc/preferenceBloc.dart';
import 'package:wallet_monitor/src/repositories/preferenceRepositoryImpl.dart';
import 'package:wallet_monitor/src/util/appDrawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PreferenceRepositoryImpl preferences = PreferenceRepositoryImpl();
  late PreferencesBloc preferencesBloc;
  final List<Map<String, String>> _themeConfigs = [
    {"value": "system", "text": "System"},
    {"value": "light", "text": "Light"},
    {"value": "dark", "text": "Dark"},
  ];
  late String _themeValue;

  @override
  void initState() {
    super.initState();
    _themeValue = '';
  }

  Future<void> getInitialValues() async {
    preferencesBloc = PreferencesBloc(
      preferenceRepository: preferences,
      initialLocale: await preferences.locale,
      initialTheme: await preferences.theme,
    );
    _themeValue = await preferences.theme;
    setState(() {});
  }

  Map<String, String> getDropdownValue() {
    if (_themeValue == 'light') return _themeConfigs[1];
    if (_themeValue == 'dark') return _themeConfigs.last;
    return _themeConfigs.first;
  }

  Future<void> changeTheme(Map<String, String>? newValue) async {
    print(newValue);
    if (newValue == null) return;

    await preferences.saveTheme(newValue["value"]!);
    // ChangeTheme(newValue["value"]!);
    preferencesBloc.on<ChangeTheme>(((event, emit) {
      print(event);
      print(emit);
      newValue["value"]!;
    }));
    setState(() {
      _themeValue = newValue["value"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getInitialValues();
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
                    changeTheme(valueSelected),
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
