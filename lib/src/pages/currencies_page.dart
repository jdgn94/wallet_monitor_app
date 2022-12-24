import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';
import 'package:wallet_monitor/src/widgets/text_field_global.dart';

class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

  @override
  _CurrenciesPageState createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final colorSchema = ColorSchemaApp();
  late AnimationController _animationController;
  late Animation _pageAnimation;
  late TextEditingController _nameCurrencyController;
  late TextEditingController _symbolCurrencyController;
  late List<Currency> allCurrencies;
  late Currency currencySelected;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) async {
            allCurrencies = await _db.getAllCurrencies();
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );

    _nameCurrencyController = TextEditingController();
    _symbolCurrencyController = TextEditingController();
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
    _nameCurrencyController.dispose();
    _symbolCurrencyController.dispose();
    _animationController.dispose();
  }

  void _openCreateCurrency() {
    AppDialog.buildMessageDialog(
      context,
      _currencyForm(),
      S.current.createCurrency,
      S.current.dialogCancelTextBottom,
      _clearInputs,
      S.current.dialogConfirmTextBottom,
      _createCurrency,
    );
  }

  void _clearInputs() {
    _nameCurrencyController.clear();
    _symbolCurrencyController.clear();
  }

  Future<void> _createCurrency() async {
    final name = _nameCurrencyController.text;
    final symbol = _symbolCurrencyController.text;
    if (name.isEmpty || symbol.isEmpty) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.createCurrencyError,
        "error",
      );
      return;
    }

    await _db.setCurrency(name, symbol);
    allCurrencies = await _db.getAllCurrencies();
    _clearInputs();
    // ignore: use_build_context_synchronously
    AppMessage.buildMessageSnackbar(
      context,
      S.current.createCurrencySuccess,
      "success",
    );
    setState(() {});
  }

  Future<void> _editCurrency() async {
    final name = _nameCurrencyController.text;
    final symbol = _symbolCurrencyController.text;
    if (name.isEmpty || symbol.isEmpty) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.editCurrencyError,
        "error",
      );
      return;
    }

    final success = await _db.putCurrency(currencySelected.id, name, symbol);
    if (success) {
      allCurrencies = await _db.getAllCurrencies();
      _clearInputs();
      // ignore: use_build_context_synchronously
      AppMessage.buildMessageSnackbar(
        context,
        S.current.editCurrencySuccess,
        "success",
      );
      setState(() {});
    } else {
      // ignore: use_build_context_synchronously
      AppMessage.buildMessageSnackbar(
        context,
        S.current.editCurrencyError,
        "success",
      );
    }
  }

  void _openEditCurrency(int index) {
    currencySelected = allCurrencies[index];
    _nameCurrencyController.text = currencySelected.name;
    _symbolCurrencyController.text = currencySelected.symbol;

    AppDialog.buildMessageDialog(
      context,
      _currencyForm(),
      S.current.editCurrency,
      S.current.dialogCancelTextBottom,
      _clearInputs,
      S.current.dialogConfirmTextBottom,
      _editCurrency,
    );
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
          child: Column(
            children: [
              _header(),
              _currenciesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currencyForm() {
    return Container(
      height: 140.0,
      constraints: const BoxConstraints(
        maxWidth: 600.0,
        minWidth: 140.0,
      ),
      child: Column(
        children: [
          TextFieldGlobal(
            textEditingController: _nameCurrencyController,
            label: S.current.currency,
          ),
          TextFieldGlobal(
            textEditingController: _symbolCurrencyController,
            label: S.current.symbol,
            maxLength: 2,
          ),
        ],
      ),
    );
  }

  Widget _header() {
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
                  S.current.currencies,
                  style: const TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            Row(
              children: [
                TextButtonGlobal(
                  callback: () => _openCreateCurrency(),
                  icon: getIcon('add'),
                  size: const Size(40.0, 55.0),
                ),
                TextButtonGlobal(
                  callback: () => returnNavigation(),
                  icon: getIcon('clear'),
                  size: const Size(40.0, 55.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _currenciesList() {
    if (isReadyToDraw) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: allCurrencies.length,
        itemBuilder: (context, index) {
          return _currencyCard(context, index);
        },
      ),
    );
  }

  Widget _currencyCard(BuildContext context, int index) {
    final currency = allCurrencies[index];
    return Slidable(
      key: Key(currency.uuid),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => _openEditCurrency(index),
            backgroundColor: colorSchema.info,
            icon: getIcon('pencil'),
            label: S.current.edit,
          )
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currency.name,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text(
                currency.symbol,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
