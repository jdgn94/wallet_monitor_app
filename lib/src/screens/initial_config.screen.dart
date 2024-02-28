import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/helper/argument.helper.dart';
import 'package:wallet_monitor/src/helper/constants/icon.constants.dart';
import 'package:wallet_monitor/src/helper/constants/image.constants.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';
import 'package:wallet_monitor/src/widgets/custom_button.widget.dart';
import 'package:wallet_monitor/src/widgets/icon_selector.widget.dart';
import 'package:wallet_monitor/src/widgets/language_selector.widget.dart';

class InitialConfigScreen extends StatelessWidget {
  const InitialConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _languageDecorator(context),
                    _title(S.current.selectLanguage),
                    const LanguageSelectorWidget(),
                    _iconDecorator(context),
                    _title(S.current.selectIcon),
                    const IconSelectorWidget(),
                  ],
                ),
              ),
            ),
            _nextButton(context),
          ],
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

  SizedBox _title(String text) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  SizedBox _iconDecorator(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.asset(ImageConstants.geometric),
    );
  }

  CustomButtonWidget _nextButton(BuildContext context) {
    return CustomButtonWidget(
      onTap: () {
        final pref = SettingsLocalStorage.configPref;
        pref.setBool("visiteInitialConfigScreen", false);
        Navigator.of(context).pushNamedAndRemoveUntil(
          "/",
          (route) => false,
          // arguments: const AccountArguments(initApp: true),
        );
      },
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      text: S.current.next,
    );
  }
}
