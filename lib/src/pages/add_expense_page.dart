import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/category.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';
import 'package:wallet_monitor/src/widgets/custom_button_global.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';
import 'package:wallet_monitor/src/widgets/text_field_global.dart';

class AddExpensePage extends StatefulWidget {
  final Rect buttonRect;
  const AddExpensePage({Key? key, required this.buttonRect}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpensePage>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final ColorSchemaApp colorSchema = ColorSchemaApp();
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
  late List<Category> allCategories;
  late List<Currency> allCurrencies;
  late AnimationController _controller;
  late Animation _buttonAnimation;
  late Animation _pageAnimation;
  late TextEditingController _descriptionController;
  late double buttonWidth;
  late Category categorySelected;
  late Currency currencySelected;
  int indexSelected = -1;
  String currencySymbol = '?';
  String integerValue = '0';
  String floatValue = '00';
  bool writeInFloat = false;
  bool isReadyToDraw = true;

  @override
  void initState() {
    final newDate = DateTime.now();
    super.initState();
    categorySelected = Category(
        uuid: '0',
        name: '',
        operation: '',
        createdAt: newDate,
        updatedAt: newDate);
    currencySelected = Currency(
        uuid: '0',
        name: '',
        symbol: '?',
        createdAt: newDate,
        updatedAt: newDate);
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) async {
            allCategories = await _db.getAllCategories();
            allCurrencies = await _db.getAllCurrencies();
            if (allCurrencies.isNotEmpty) {
              currencySelected = allCurrencies[0];
              currencySymbol = allCurrencies[0].symbol;
            }
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
    _pageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    allCategories = await _db.getAllCategories();
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

  void _openChangeCurrency() {
    AppDialog.buildMessageDialog(
      context,
      _currenciesList(context),
      S.current.currencies,
      null,
      null,
      null,
      null,
    );
  }

  void _changeCurrency(BuildContext dialogContext, Currency currency) {
    Navigator.pop(dialogContext);
    setState(() {
      currencySelected = currency;
      currencySymbol = currency.symbol;
    });
  }

  void _verifyValuesToCreateTransaction() {
    String messageError = '';
    if (currencySelected.uuid == '0') {
      messageError = S.current.currencyNoSelected;
    } else if (categorySelected.uuid == '0') {
      messageError = S.current.categoryNoSelected;
    } else if (integerValue == '0' && floatValue == '00') {
      messageError = S.current.amountNoFound;
    }

    if (messageError.isNotEmpty) {
      AppMessage.buildMessageSnackbar(
        context,
        messageError,
        "error",
      );
      return;
    }

    AppDialog.buildMessageDialog(
      context,
      _dialogConfirmTransaction(context, setState),
      S.current.addTransaction,
      S.current.dialogCancelTextBottom,
      null,
      S.current.dialogConfirmTextBottom,
      () {},
    );
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
                offset: Offset(0, h * (1 - _pageAnimation.value)),
                child: _pageContent(),
              ),
              _button(),
            ],
          ),
        ),
      ),
    );
  }

  // dialog add transaction
  Widget _dialogConfirmTransaction(context, setStateDialog) {
    int counter = 0;
    return SizedBox(
      width: 400.0,
      height: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_descriptionController.text.isEmpty)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Icon(getIcon('warning'), color: colorSchema.warning),
                ),
                Text(
                  S.current.noDescription,
                  style: TextStyle(
                    color: colorSchema.warning,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          Text(counter.toString()),
          ElevatedButton(
            onPressed: () {
              print("aqui estoy, $counter");
              setStateDialog(() {
                ++counter;
              });
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
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
        itemCount: allCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = allCategories[index];
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
          CustomButtonGlobal(
            onTap: () => setState(() {
              categorySelected = category;
              indexSelected = index;
            }),
            width: 60.0,
            height: 60.0,
            borderRadiusCircular: 60,
            borderWidth: 1,
            borderColor: colorSchema.primary,
            isBackground: indexSelected == index,
            backgroundColor: _categoryBackgroundColor(index),
            child: Icon(getIcon(category.name)),
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

  Widget _currenciesList(BuildContext dialogContext) {
    final currenciesQuantity = allCurrencies.length;
    return Container(
      height: 60.0 * currenciesQuantity,
      width: 400.0,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 200,
      ),
      child: ListView.separated(
        itemCount: currenciesQuantity,
        separatorBuilder: (_, __) {
          return const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(),
          );
        },
        itemBuilder: (_, index) {
          final currency = allCurrencies[index];
          return InkWell(
            onTap: () => _changeCurrency(dialogContext, currency),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            splashColor: colorSchema.primary.withOpacity(0.5),
            hoverColor: colorSchema.primary.withOpacity(0.3),
            child: Ink(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: currency.id == currencySelected.id
                      ? (Theme.of(context).brightness == Brightness.dark
                          ? colorSchema.primaryMoreDark
                          : colorSchema.primaryLight)
                      : Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currency.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currency.symbol,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
          CustomButtonGlobal(
            onTap: () => _openChangeCurrency(),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              currencySymbol,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
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
            margin: const EdgeInsets.only(left: 10.0),
            child: CustomButtonGlobal(
              onTap: () => setState(() {
                integerValue = '0';
                floatValue = '00';
                writeInFloat = false;
              }),
              borderRadiusCircular: 90,
              borderWidth: 1,
              borderColor: colorSchema.primary,
              width: 50.0,
              height: 50.0,
              child: Icon(getIcon('C')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxDescription() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 615.0),
      padding: const EdgeInsets.all(10.0),
      child: TextFieldGlobal(
        textEditingController: _descriptionController,
        label: S.current.description,
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
              child: CustomButtonGlobal(
                onTap: () => _actionKeyboard(symbol),
                width: MediaQuery.of(context).size.width * 0.315,
                height: MediaQuery.of(context).size.height * 0.25 - 130,
                maxWidth: 200,
                borderWidth: 1,
                borderColor: colorSchema.primary,
                child: Center(
                  child: symbol == '<'
                      ? Icon(getIcon(symbol), size: 45.0)
                      : Text(symbol, style: const TextStyle(fontSize: 45.0)),
                ),
              ),
            );
          }).toList(),
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
          callback: () => _verifyValuesToCreateTransaction(),
          text: S.current.addTransaction,
          textColor: Colors.white,
          size: Size(MediaQuery.of(context).size.width, 70.0),
        ),
      );
    }
  }
}
