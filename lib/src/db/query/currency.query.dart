import 'package:sqflite/sqflite.dart';

import 'package:wallet_monitor/src/db/models/currency.model.dart';
import 'package:wallet_monitor/src/db/services/database.service.dart';

export 'package:wallet_monitor/src/db/models/currency.model.dart';

abstract class CurrencyQuery {
  static final _db = DatabaseService().db;

  static Future<List<CurrencyModel>> getAll({bool translate = true}) async {
    final result = await _db.rawQuery("""
      SELECT * FROM currencies WHERE deleted = 0
    """);

    final currencies = currencyModelFromList(result, translate: translate);

    return currencies;
  }

  static Future<List<CurrencyModel>> getAllByAccounts() async {
    final resultCurrenciesIds = await _db.rawQuery("""
      SELECT
        c.id
      FROM
        accounts a
        INNER JOIN currencies c ON a.currency_id = c.id
      GROUP BY
        a.currency_id
    """);

    final List<int> currenciesIds =
        resultCurrenciesIds.map((x) => x['id'] as int).toList();

    final resultCurrencies = await _db.rawQuery("""
      SELECT * FROM currencies WHERE id IN (${currenciesIds.join(",")})
    """);

    final currencies = currencyModelFromList(resultCurrencies);

    return currencies;
  }

  static Future<CurrencyModel> getById(int id) async {
    final result = await _db.rawQuery("""
      SELECT * FROM currencies WHERE id = $id
    """);

    final currencyJson = result[0];

    final currency = CurrencyModel.fromMap(currencyJson);

    return currency;
  }

  static Future<void> insertOrUpdate({
    required int id,
    required String code,
    required String name,
    required int decimalDigits,
    required double exchangeRate,
    required String symbol,
    required bool deleted,
  }) async {
    await _db.insert(
      "currencies",
      {
        "id": id,
        "code": code,
        "name": name,
        "decimal_digits": decimalDigits,
        "exchange_rate": exchangeRate,
        "symbol": symbol,
        "deleted": deleted,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
