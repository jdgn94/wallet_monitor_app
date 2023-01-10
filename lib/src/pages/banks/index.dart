import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rect_getter/rect_getter.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/widgets/app_bar_global.dart';

import '../../util/icons.dart';

class BanksPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const BanksPage({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _BanksPageState createState() => _BanksPageState();
}

class _BanksPageState extends State<BanksPage>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  late List<Bank>? allBanks;
  bool isReadyToDraw = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 10)).then((v) async {
            allBanks = await _db.getAllBanks();
            setState(() {
              isReadyToDraw = false;
            });
          });
        }
      },
    );
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
      appBar: AppBarGlobal(
        scaffoldKey: widget.scaffoldKey,
        title: S.current.banks,
        route: 'banks',
      ),
      body: viewPage(),
    );
  }

  Widget viewPage() {
    return Ink(
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(child: _banksList()),
    );
  }

  Widget _banksList() {
    if (isReadyToDraw) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return StreamBuilder<List<Bank>>(
      stream: _db.getAllBanksSync(),
      builder: (context, snapshot) {
        final banks = snapshot.data ?? allBanks;

        if (banks == null || banks.isEmpty) {
          return Center(child: Text(S.current.noBanks));
        }

        return ListView.builder(
          itemCount: banks.length,
          itemBuilder: (context, index) =>
              _bankCard(context, banks[index], index),
        );
      },
    );
  }

  Widget _bankCard(BuildContext context, Bank bank, int index) {
    final itemKey = RectGetter.createGlobalKey();

    return Slidable(
      key: itemKey,
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Text(
            bank.name,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
