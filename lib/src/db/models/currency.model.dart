import 'dart:convert';

class CurrencyModel {
  int id;
  String name;
  String code;
  String abbr;
  String symbol;
  double exchangeRate;
  int decimalDigits;
  bool deleted;

  CurrencyModel(
    this.id,
    this.name,
    this.code,
    this.abbr,
    this.symbol,
    this.exchangeRate,
    this.decimalDigits,
    this.deleted,
  );

  CurrencyModel copyWith({
    int? id,
    String? name,
    String? code,
    String? abbr,
    String? symbol,
    double? exchangeRate,
    int? decimalDigits,
    bool? deleted,
  }) {
    return CurrencyModel(
      id ?? this.id,
      name ?? this.name,
      code ?? this.code,
      abbr ?? this.abbr,
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
      'abbr': abbr,
      'symbol': symbol,
      'exchangeRate': exchangeRate,
      'decimalDigits': decimalDigits,
      'deleted': deleted,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      map['id'] as int,
      map['name'] as String,
      map['code'] as String,
      map['abbr'] as String,
      map['symbol'] as String,
      map['exchangeRate'] as double,
      map['decimalDigits'] as int,
      map['deleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrencyModel(id: $id, name: $name, code: $code, abbr: $abbr, symbol: $symbol, exchangeRate: $exchangeRate, decimalDigits: $decimalDigits, deleted: $deleted)';
  }

  @override
  bool operator ==(covariant CurrencyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.code == code &&
        other.abbr == abbr &&
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
        abbr.hashCode ^
        symbol.hashCode ^
        exchangeRate.hashCode ^
        decimalDigits.hashCode ^
        deleted.hashCode;
  }
}
