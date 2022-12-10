import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/settings/settings_bloc.dart';
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';

class SettingsLanguageWidget extends StatefulWidget {
  const SettingsLanguageWidget({Key? key}) : super(key: key);

  @override
  _SettingsLanguageWidgetState createState() => _SettingsLanguageWidgetState();
}

class _SettingsLanguageWidgetState extends State<SettingsLanguageWidget> {
  final colorSchema = ColorSchemaApp();
  final SharedPreferences pref = SettingsLocalStorage.pref;
  late List<Map<String, String>> _languageList;

  Future<void> openListLanguages() async {
    final languages = S.delegate.supportedLocales;
    _languageList = [
      {"value": "", "text": S.current.system}
    ];
    for (var language in languages) {
      final languageStr = language.toString();

      _languageList.add({
        "value": languageStr,
        "text": languageStr == 'en' ? S.current.en : S.current.es
      });
    }

    setState(() {});
    AppDialog.buildMessageDialog(
      context,
      listLanguages(),
      S.current.languages,
      null,
      null,
      null,
      null,
    );
  }

  Future<void> changeLanguage(
    BuildContext context,
    Map<String, String> language,
  ) async {
    BlocProvider.of<SettingsBloc>(context)
        .add(ChangeLanguage(language['value'] ?? ''));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: () => openListLanguages(),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.language,
                    color: colorSchema.primary,
                    size: 50.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.languages,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          pref.getString('lang') == 'en'
                              ? S.current.en
                              : pref.getString('lang') == 'es'
                                  ? S.current.es
                                  : S.current.system,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget listLanguages() {
    return Container(
      width: 300,
      height: 130,
      child: ListView.builder(
        itemCount: _languageList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => changeLanguage(context, _languageList[index]),
            child: ListTile(
              title: Text(_languageList[index]['text'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
