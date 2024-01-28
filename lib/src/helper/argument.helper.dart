import 'package:wallet_monitor/src/db/models/account.model.dart';

class AccountArguments {
  final AccountModel? account;
  final bool initApp;

  const AccountArguments({this.account, this.initApp = false});
}
