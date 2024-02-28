import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/bloc/global/global_bloc.dart';
import 'package:wallet_monitor/src/helper/constants/icon.constants.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

class LanguageSelectorWidget extends StatefulWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;

  const LanguageSelectorWidget({
    Key? key,
    this.margin,
    this.padding,
    this.width,
  }) : super(key: key);

  @override
  State<LanguageSelectorWidget> createState() => _LanguageSelectorWidgetState();
}

class _LanguageSelectorWidgetState extends State<LanguageSelectorWidget> {
  SharedPreferences pref = SettingsLocalStorage.configPref;
  final List<String> _languageList = ["und", "es", "en"];

  @override
  void initState() {
    super.initState();
  }

  void _openLanguageSelector() {
    showDialog(context: context, builder: (BuildContext ctx) => _dialog(ctx));
  }

  void _changeLanguage(BuildContext ctx, String lang) {
    Navigator.pop(ctx);
    BlocProvider.of<GlobalBloc>(context).add(ChangeLanguage(lang: lang));
  }

  String _languages({String? lang}) {
    switch (lang ?? pref.getString("lang")) {
      case "es":
        return "Español";
      case "en":
        return "English";
      default:
        return S.current.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          margin: widget.margin ?? const EdgeInsets.all(0),
          padding: widget.padding ?? const EdgeInsets.all(0),
          width: widget.width,
          child: InkWell(
            onTap: _openLanguageSelector,
            borderRadius: BorderRadius.circular(40),
            child: Ink(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).colorScheme.background,
                boxShadow: [
                  StylesHelper.boxShadow(context),
                ],
              ),
              child: inputBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Row inputBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              IconConstants.language,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 5),
            Text(S.current.language),
          ],
        ),
        Ink(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            _languages(),
          ),
        ),
      ],
    );
  }

  AlertDialog _dialog(BuildContext ctx) {
    return AlertDialog(
      title: Text(S.current.language),
      content: _dialogContent(ctx),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(S.current.cancel),
        ),
      ],
    );
  }

  Widget _dialogContent(BuildContext ctx) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 200,
        child: Wrap(
          direction: Axis.vertical,
          runAlignment: WrapAlignment.center,
          children: _languageList
              .map((String lang) => _languageItem(ctx, lang))
              .toList(),
        ),
      ),
    );
  }

  Widget _languageItem(BuildContext ctx, String lang) {
    return InkWell(
      onTap: () => _changeLanguage(ctx, lang),
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: 230,
        decoration: BoxDecoration(
          color: (pref.getString("lang") ?? "und") == lang
              ? Theme.of(ctx).colorScheme.primary.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          _languages(lang: lang),
        ),
      ),
    );
  }
}
