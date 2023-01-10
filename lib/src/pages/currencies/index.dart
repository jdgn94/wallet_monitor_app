import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rect_getter/rect_getter.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/pages/currencies/add_currency.dart';
import 'package:wallet_monitor/src/pages/home_page.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/app_page_transition.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/app_bar_global.dart';

class CurrenciesPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CurrenciesPage({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  _CurrenciesPageState createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final colorSchema = ColorSchemaApp();
  late TextEditingController _nameCurrencyController;
  late TextEditingController _symbolCurrencyController;
  late List<Currency>? allCurrencies;
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
  }

  @override
  void dispose() {
    super.dispose();
    _nameCurrencyController.dispose();
    _symbolCurrencyController.dispose();
  }

  Future<void> _openEditCurrency(
    Currency currency,
    GlobalKey<RectGetterState> rectKey,
  ) async {
    final buttonRect = RectGetter.getRectFromKey(rectKey);

    AppPageTransition page = AppPageTransition(
      background: const HomePage(initialPage: 2),
      page: AddCurrency(
        buttonRect: buttonRect!,
        currency: currency,
      ),
    );

    final result = await Navigator.of(context).push(page);

    if (!mounted) return;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    if (result != null) {
      await Future.delayed(const Duration(milliseconds: 100));
      // ignore: use_build_context_synchronously
      AppMessage.buildMessageSnackbar(
        context,
        result["message"],
        result["status"],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        scaffoldKey: widget.scaffoldKey,
        title: S.current.currencies,
        route: 'currencies',
      ),
      body: viewPage(),
    );
  }

  Widget viewPage() {
    return Ink(
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(child: _currenciesList()),
    );
  }

  Widget _currenciesList() {
    if (isReadyToDraw) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return StreamBuilder<List<Currency>>(
      stream: _db.getAllCurrenciesSync(),
      builder: (context, snapshot) {
        final currencies = snapshot.data ?? allCurrencies;
        // _updateCurrenciesData(currencies);
        if (currencies == null || currencies.isEmpty) {
          return Center(child: Text(S.current.noCurrencies));
        }
        return ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (context, index) =>
              _currencyCard(context, currencies[index], index),
        );
      },
    );
  }

  Widget _currencyCard(BuildContext context, Currency currency, int index) {
    final itemKey = RectGetter.createGlobalKey();

    return Slidable(
      key: itemKey,
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => _openEditCurrency(currency, itemKey),
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
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currency.symbol,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
