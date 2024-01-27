import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/helper/constants/icon.constants.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';
import 'package:wallet_monitor/src/widgets/custom_button.widget.dart';
import 'package:wallet_monitor/src/widgets/language_selector.widget.dart';

class LanguageSelectorScreen extends StatelessWidget {
  const LanguageSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _languageDecorator(context),
              _title(),
              const LanguageSelectorWidget(
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              const Expanded(child: SizedBox()),
              _nextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _languageDecorator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      height: 150,
      child: Center(
        child: Icon(
          IconConstants.language,
          size: 130,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      // child: Stack(
      //   children: [],
      // ),
    );
  }

  SizedBox _title() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        S.current.selectLanguage,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return CustomButtonWidget(
      onTap: () {
        final pref = SettingsLocalStorage.configPref;
        pref.setBool("visiteSelectLangScreen", false);
        pref.setBool("visitAccountInitScreen", true);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/account_init", (route) => false);
      },
      text: S.current.next,
    );
  }
}
