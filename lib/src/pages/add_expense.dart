import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';

class AddExpensePage extends StatefulWidget {
  final Rect buttonRect;
  const AddExpensePage({Key? key, required this.buttonRect}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpensePage>
    with SingleTickerProviderStateMixin {
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  late AnimationController _controller;
  late Animation _buttonAnimation;
  late Animation _pageAnimation;
  late double buttonWidth;

  @override
  void initState() {
    print(widget.buttonRect);
    super.initState();
    buttonWidth = window.physicalSize.shortestSide * .2 - 10;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _pageAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
    _controller.addListener(() {
      setState(() {
        buttonWidth = (MediaQuery.of(context).size.width * .2 - 10) +
            (MediaQuery.of(context).size.width * .8 * _buttonAnimation.value);
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(-1, h * (1 - _pageAnimation.value)),
                child: _pageContent(),
              ),
              _backButton(),
              _button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return Positioned(
      top: 0,
      right: 0,
      child: TextButtonGlobal(
        callback: () {
          _controller.reverse();
          // Navigator.of(context).pop();
        },
        icon: getIcon('clear'),
        size: const Size(40, 55),
      ),
    );
  }

  Widget _button() {
    if (_controller.value < 1) {
      return Positioned(
        top: widget.buttonRect.top,
        width: MediaQuery.of(context).size.width,
        height: 70.0,
        child: Column(
          children: [
            Container(
              width: buttonWidth,
              height: 40.0 + (30.0 * _buttonAnimation.value),
              decoration: BoxDecoration(
                color: colorSchema.primary,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(getIcon('add'), color: Colors.white),
            ),
          ],
        ),
      );
    } else {
      return Positioned(
        top: widget.buttonRect.top,
        child: ButtonGlobal(
          callback: () {},
          text: 'add expense',
          textColor: Colors.white,
          size: Size(MediaQuery.of(context).size.width, 70.0),
        ),
      );
    }
  }

  Widget _pageContent() {
    return Container(
      padding: const EdgeInsets.only(bottom: 70.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
