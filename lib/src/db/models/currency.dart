import 'dart:io';
import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:wallet_monitor/src/db/models/bank_and_currency.dart';

part 'currency.g.dart';

@Collection()
class Currency {
  Id id = Isar.autoIncrement;
  @Index(unique: true, caseSensitive: true)
  String uuid;
  @Index(unique: true, caseSensitive: true)
  String name;
  String symbol;
  DateTime createdAt;
  DateTime updatedAt;
  final banksAndCurrency = IsarLinks<BankAndCurrency>();

  Currency({
    required this.uuid,
    required this.name,
    required this.symbol,
    required this.createdAt,
    required this.updatedAt,
  });
}
