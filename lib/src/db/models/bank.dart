import 'dart:io';
import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:wallet_monitor/src/db/models/bank_and_currency.dart';

part 'bank.g.dart';

@Collection()
class Bank {
  Id id = Isar.autoIncrement;
  @Index(unique: true, caseSensitive: true)
  String uuid;
  @Index(unique: true, caseSensitive: true)
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  final bankAndCurrencies = IsarLinks<BankAndCurrency>();

  Bank({
    required this.uuid,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
}
