import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wallet_monitor/generated/l10n.dart';

import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';

import '../util/icons.dart';

class BanksPage extends StatefulWidget {
  const BanksPage({Key? key}) : super(key: key);

  @override
  _BanksPageState createState() => _BanksPageState();
}

class _BanksPageState extends State<BanksPage>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final ColorSchemaApp colorSchema = ColorSchemaApp();
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
    _pageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
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
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Transform.translate(
        offset: Offset(-1, h * (1 - _pageAnimation.value)),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              _titleAndButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleAndButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: Icon(getIcon('bank')),
              ),
              Text(S.current.bank),
            ],
          ),
          TextButtonGlobal(
            callback: () {
              _animationController.reverse();
            },
            icon: getIcon('clear'),
            size: const Size(40, 55),
          ),
        ],
      ),
    );
  }
}
