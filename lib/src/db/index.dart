import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'package:uuid/uuid.dart';
// -----------------------------
import 'package:wallet_monitor/src/db/models/currency.dart';

class DB {
  static late Box _currencies;

  DB();

  static Future<void> initDB() async {
    final path = await PathProvider.getApplicationDocumentsDirectory();
    Hive.init(path.path);

    Hive.registerAdapter(CurrencyAdapter());

    _currencies = await Hive.openBox('currencies');
  }

  String _generateUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }

  Box getAllCurrencies() => _currencies;

  Future<void> createCurrency(String name, String symbol, String color) async {
    final newDate = DateTime.now();
    final newCurrency = Currency(
      uuid: _generateUuid(),
      name: name,
      symbol: symbol,
      createdAt: newDate,
      updatedAt: newDate,
    );
  }
}
