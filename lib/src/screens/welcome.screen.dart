import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _carouselController.dispose;
    super.dispose();
  }

  void _redirect() {
    final pref = SettingsLocalStorage.configPref;
    pref.setBool("visiteWelcomeScreen", false);
    pref.setBool("visiteSelectLangScreen", true);

    Navigator.of(context).pushNamedAndRemoveUntil(
      "/language_selector",
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _skipWelcome(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .7,
            child: PageView(
              controller: _carouselController,
              children: [
                _carouselPageOne(),
                _carouselPageOne(),
                _carouselPageOne(),
              ],
            ),
          ),
          // if (_carouselController.positions.isNotEmpty)
          _navigationController(),
        ],
      ),
    );
  }

  TextButton _skipWelcome() {
    return TextButton(
      onPressed: _redirect,
      child: Text(S.current.skip),
    );
  }

  Column _carouselPageOne() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: const Placeholder(),
        ),
        Text(S.current.welcome),
      ],
    );
  }

  Row _navigationController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          // visible: _carouselController.position ==
          //     _carouselController.positions.last,
          replacement: const SizedBox(),
          child: TextButton(
            onPressed: () {
              if (_carouselController.position ==
                  _carouselController.positions.last) _redirect();
              _carouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn);
              setState(() {});
            },
            child: Text(S.current.next),
          ),
        ),
      ],
    );
  }
}
