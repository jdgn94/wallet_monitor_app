import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/settings/app_color.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_app_bar.widget.dart';
import 'package:wallet_monitor/src/widgets/box.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_text.widget.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        title: S.current.accounts,
        pinned: false,
        child: _body(context),
      ),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxWidget(
              title: "Net Worth",
              subtitle: "\$ 600.00",
              note: "11 transacctions",
              width: double.infinity,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                BoxWidget(
                  title: "Expenses",
                  subtitle: "\$ 350.00",
                  note: "11 transacctions",
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  subtitleColor: AlertColors.error,
                ),
                const SizedBox(width: 16.0),
                BoxWidget(
                  title: "Incomes",
                  subtitle: "\$ 950.00",
                  note: "11 transacctions",
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  subtitleColor: AlertColors.success,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            SubtitleWidget(text: S.current.accounts),
          ],
        ),
      ),
    );
  }
}
