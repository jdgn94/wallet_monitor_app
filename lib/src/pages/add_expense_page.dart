import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/category.dart';
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
  late List<Category> categories;
  final List<String> keyboardSymbol = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '<'
  ];
  late AnimationController _controller;
  late Animation _buttonAnimation;
  late Animation _pageAnimation;
  late TextEditingController _descriptionController;
  late double buttonWidth;
  late Category categorySelected;
  int indexSelected = -1;
  String moneySymbol = '\$';
  String integerValue = '0';
  String floatValue = '00';
  bool writeInFloat = false;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) async {
            categories = await DB().getAllCategories();
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );
    buttonWidth = window.physicalSize.shortestSide * .2 - 10;
    _descriptionController = TextEditingController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _pageAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
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
    _descriptionController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> getGategories() async {
    categories = await DB().getAllCategories();
  }

  void _actionKeyboard(String value) {
    print(value);
    if (value == '.') {
      writeInFloat = true;
      return;
    }

    if (value == '<') {
      if (writeInFloat) {
        String newFloatValue = '';
        if (floatValue[0] == '0') {
          newFloatValue = '00';
          writeInFloat = false;
        } else {
          newFloatValue = '0${floatValue[0]}';
        }
        setState(() {
          floatValue = newFloatValue;
        });
        return;
      }

      if (integerValue == '0') return;
      String newIntegerValue = '';
      if (integerValue.length == 1) {
        newIntegerValue = '0';
      } else {
        for (int i = 0; i < integerValue.length - 1; i++) {
          newIntegerValue += integerValue[i];
        }
      }
      setState(() {
        integerValue = newIntegerValue;
      });
      return;
    }

    if (writeInFloat) {
      String newFloatValue = '';
      if (floatValue[0] == '0') {
        newFloatValue = '${floatValue[1]}$value';
        setState(() {
          floatValue = newFloatValue;
        });
      }
      return;
    }

    if (integerValue.length >= 9) return;
    if (integerValue.length == 1 && integerValue[0] == '0') {
      setState(() {
        integerValue = value;
      });
      return;
    }

    setState(() {
      integerValue += value;
    });
    return;
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
              _button(),
            ],
          ),
        ),
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
    return Ink(
      padding: const EdgeInsets.only(bottom: 70.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Stack(
            children: [
              _categorySelected(),
              _backButton(),
            ],
          ),
          _scrollCategories(),
          _quantityInserted(),
          _boxDescription(),
          _keyboardNumeric(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButtonGlobal(
            callback: () {},
            icon: getIcon('calendar'),
            size: const Size(40, 55),
          ),
          TextButtonGlobal(
            callback: () {
              _controller.reverse();
            },
            icon: getIcon('clear'),
            size: const Size(40, 55),
          ),
        ],
      ),
    );
  }

  Widget _categorySelected() {
    return Container(
      width: double.infinity,
      height: 60.0,
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Text(
        indexSelected == -1
            ? S.current.categories
            : getCategory(categorySelected.name),
        style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _scrollCategories() {
    if (isReadyToDraw) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _category(category, index);
        },
      ),
    );
  }

  Widget _category(Category category, int index) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                categorySelected = category;
                indexSelected = index;
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            splashColor: colorSchema.primary.withOpacity(.5),
            hoverColor: colorSchema.primary.withOpacity(.3),
            focusColor: colorSchema.primary.withOpacity(.3),
            child: Ink(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  border: Border.all(color: colorSchema.primary, width: 1.0),
                  color: _categoryBackgroundColor(index)),
              child: Icon(getIcon(category.name)),
            ),
          ),
          Text(
            getCategory(category.name),
            style: const TextStyle(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Color _categoryBackgroundColor(int index) {
    if (indexSelected != index) return Colors.transparent;

    if (Theme.of(context).brightness == Brightness.dark) {
      return colorSchema.primaryMoreDark;
    }

    return colorSchema.primaryMoreLight;
  }

  Widget _quantityInserted() {
    return Container(
      width: double.infinity,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      constraints: const BoxConstraints(maxWidth: 615),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Text(
              moneySymbol,
              style: TextStyle(
                fontSize: 45.0,
                color: colorSchema.primary,
              ),
            ),
          ),
          Text(
            '$integerValue.$floatValue',
            style: TextStyle(
              fontSize: 45.0,
              color: colorSchema.primary,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  integerValue = '0';
                  floatValue = '00';
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(90.0)),
              splashColor: colorSchema.primary.withOpacity(.5),
              hoverColor: colorSchema.primary.withOpacity(.3),
              focusColor: colorSchema.primary.withOpacity(.3),
              child: Ink(
                width: 65.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                  border: Border.all(width: 1.0, color: colorSchema.primary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(getIcon('A')),
                    Icon(getIcon('C')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxDescription() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 615.0),
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: _descriptionController,
        decoration: InputDecoration(
          label: Text('description'),
        ),
        maxLines: 3,
        maxLength: 200,
      ),
    );
  }

  Widget _keyboardNumeric() {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 615),
        child: Wrap(
          direction: Axis.horizontal,
          children: keyboardSymbol.map((symbol) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  _actionKeyboard(symbol);
                },
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                splashColor: colorSchema.primary.withOpacity(.5),
                hoverColor: colorSchema.primary.withOpacity(.3),
                focusColor: colorSchema.primary.withOpacity(.3),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.315,
                  height: MediaQuery.of(context).size.height * 0.25 - 130,
                  constraints: const BoxConstraints(maxWidth: 200),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: colorSchema.primary),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: symbol == '.'
                        ? Text(symbol, style: const TextStyle(fontSize: 45))
                        : Icon(getIcon(symbol), size: 45),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
