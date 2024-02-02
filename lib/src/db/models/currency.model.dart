import 'dart:convert';

import 'package:wallet_monitor/src/helper/currency.helper.dart';

class CurrencyModel {
  final int id;
  final String name;
  final String code;
  final String symbol;
  double exchangeRate;
  final int decimalDigits;
  final bool deleted;

  CurrencyModel(
    this.id,
    this.name,
    this.code,
    this.symbol,
    this.exchangeRate,
    this.decimalDigits,
    this.deleted,
  );

  CurrencyModel copyWith({
    int? id,
    String? name,
    String? code,
    String? symbol,
    double? exchangeRate,
    int? decimalDigits,
    bool? deleted,
  }) {
    return CurrencyModel(
      id ?? this.id,
      name ?? this.name,
      code ?? this.code,
      symbol ?? this.symbol,
      exchangeRate ?? this.exchangeRate,
      decimalDigits ?? this.decimalDigits,
      deleted ?? this.deleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
      'exchange_rate': exchangeRate,
      'decimal_digits': decimalDigits,
      'deleted': deleted,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map,
      {bool translate = true}) {
    return CurrencyModel(
      map['id'] as int,
      translate ? CurrencyHelper.name(map['name']) : (map['name'] as String),
      map['code'] as String,
      map['symbol'] as String,
      map['exchange_rate'].toDouble() as double,
      map['decimal_digits'] as int,
      map['deleted'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrencyModel(id: $id, name: $name, code: $code, symbol: $symbol, exchangeRate: $exchangeRate, decimalDigits: $decimalDigits, deleted: $deleted)';
  }

  @override
  bool operator ==(covariant CurrencyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.code == code &&
        other.symbol == symbol &&
        other.exchangeRate == exchangeRate &&
        other.decimalDigits == decimalDigits &&
        other.deleted == deleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        code.hashCode ^
        symbol.hashCode ^
        exchangeRate.hashCode ^
        decimalDigits.hashCode ^
        deleted.hashCode;
  }
}

List<CurrencyModel> currencyModelFromList(List<Map<String, dynamic>> list,
        {bool translate = true}) =>
    list
        .map((item) => CurrencyModel.fromMap(item, translate: translate))
        .toList();
