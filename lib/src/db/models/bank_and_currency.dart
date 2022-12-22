import 'dart:io';
import 'dart:convert';

import 'package:isar/isar.dart';

import 'package:wallet_monitor/src/db/models/bank.dart';
import 'package:wallet_monitor/src/db/models/currency.dart';

part 'bank_and_currency.g.dart';

@Collection()
class BankAndCurrency {
  Id id = Isar.autoIncrement;
  @Backlink(to: 'bankAndCurrencies')
  final bank = IsarLink<Bank>();
  @Backlink(to: 'banksAndCurrency')
  final currency = IsarLink<Currency>();
  DateTime createdAt;
  DateTime updatedAt;

  BankAndCurrency({
    required this.createdAt,
    required this.updatedAt,
  });
}
