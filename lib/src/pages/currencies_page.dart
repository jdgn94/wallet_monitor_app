import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';

class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

  @override
  _CurrenciesPageState createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _pageAnimation;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) async {
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _pageAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInBack,
      ),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Transform.translate(
        offset: Offset(-1, h * (1 - _pageAnimation.value)),
        child: Ink(
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: [
              _headder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headder() {
    void returnNavigation() {
      _animationController.reverse();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'currency',
                  child: Icon(getIcon('currency')),
                ),
                const SizedBox(width: 10.0),
                Text(
                  S.current.currency,
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            TextButtonGlobal(
              callback: () => returnNavigation(),
              icon: getIcon('clear'),
              size: Size(40.0, 55.0),
            ),
          ],
        ),
      ),
    );
  }
}
