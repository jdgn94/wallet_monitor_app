import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'package:uuid/uuid.dart';

import 'package:wallet_monitor/src/db/models/currency.dart';
import 'package:wallet_monitor/src/db/models/category.dart';
import 'package:wallet_monitor/src/db/models/bank.dart';
import 'package:wallet_monitor/src/db/models/bank_and_currency.dart';

export 'package:wallet_monitor/src/db/models/currency.dart';
export 'package:wallet_monitor/src/db/models/category.dart';
export 'package:wallet_monitor/src/db/models/bank.dart';
export 'package:wallet_monitor/src/db/models/bank_and_currency.dart';

class DB {
  static late Isar _db;

  DB();

  static Future<void> initDB() async {
    print("Estoy en la inicialización de la bd");
    // final path = await PathProvider.getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      _db = await Isar.open(
        [CurrencySchema, CategorySchema, BankSchema, BankAndCurrencySchema],
        inspector: true,
      );
    } else {
      _db = await Future.value(Isar.getInstance());
    }
    await _insertSeeds();
  }

  String _generateUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }

  static Future<void> _insertSeeds() async {
    final isar = _db;
    final newDate = DateTime.now();
    final categoriesInserted = isar.categorys;

    String input =
        await File('lib/src/db/seeds/categories.json').readAsString();
    dynamic json = jsonDecode(input);
    final List<dynamic> categories = json['categories'];
    final int totalCategoriesInSeeds = categories.length;
    int newSeedInserted = 0;

    for (int i = 0; i < totalCategoriesInSeeds; i++) {
      final categoryInserted = await categoriesInserted
          .filter()
          .uuidEqualTo(categories[i]['uuid'])
          .findAll();
      print(categoryInserted);

      if (categoryInserted.isEmpty) {
        final category = Category(
          uuid: categories[i]['uuid'],
          name: categories[i]['name'],
          operation: categories[i]['operation'],
          createdAt: newDate,
          updatedAt: newDate,
        );

        isar.writeTxnSync(() => categoriesInserted.putSync(category));
      }
    }
  }

  Future<List<Category>> getAllCategories() async =>
      await _db.categorys.where().findAll();

  Future<void> setCurrency(String name, String symbol) async {
    final isar = _db;
    final newDate = DateTime.now();
    final newCurrency = Currency(
      uuid: _generateUuid(),
      name: name,
      symbol: symbol,
      createdAt: newDate,
      updatedAt: newDate,
    );

    isar.writeTxnSync(() => isar.currencys.putSync(newCurrency));
  }

  Future<bool> putCurrency(int id, String name, String symbol) async {
    final isar = _db;
    final currencyToUpdate = await isar.currencys.get(id);
    if (currencyToUpdate != null) {
      currencyToUpdate.name = name;
      currencyToUpdate.symbol = symbol;
      currencyToUpdate.createdAt = DateTime.now();
      isar.writeTxnSync(() => isar.currencys.putByUuidSync(currencyToUpdate));
      return true;
    }
    return false;
  }

  Future<List<Currency>> getAllCurrencies() async {
    return await _db.currencys.where().findAll();
  }

  Stream<List<Currency>> getAllCurrenciesSync() async* {
    yield* _db.currencys.where().watch();
  }

  Future<void> setBank(String name) async {
    final isar = _db;
    final newDate = DateTime.now();
    final newBank = Bank(
      uuid: _generateUuid(),
      name: name,
      createdAt: newDate,
      updatedAt: newDate,
    );

    await isar.writeTxnSync(() => isar.banks.putSync(newBank));
  }

  Future<bool> putBank(int id, String name) async {
    final isar = _db;
    final bankToUpdate = await isar.banks.get(id);
    if (bankToUpdate != null) {
      bankToUpdate.name = name;
      bankToUpdate.updatedAt = DateTime.now();
      await isar.writeTxnSync(() => isar.banks.putByUuid(bankToUpdate));
      return true;
    }
    return false;
  }

  Future<List<Bank>> getAllBanks() async {
    return await _db.banks.where().findAll();
  }

  Stream<List<Bank>> getAllBanksSync() async* {
    yield* _db.banks.where().watch();
  }
}
