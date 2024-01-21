import 'dart:convert';

import 'package:wallet_monitor/src/db/models/bank.model.dart';
import 'package:wallet_monitor/src/db/models/currency.model.dart';

class Account {
  int id;
  String name;
  String icon;
  String description;
  int colorIndex;
  double amount;
  double minAmount;
  int currencyId;
  int? bankId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int totalTransactions;
  CurrencyModel currency;
  BankModel? bank;
  Account({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.colorIndex,
    required this.amount,
    required this.minAmount,
    required this.currencyId,
    this.bankId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.totalTransactions,
    required this.currency,
    this.bank,
  });

  Account copyWith({
    int? id,
    String? name,
    String? icon,
    String? description,
    int? colorIndex,
    double? amount,
    double? minAmount,
    int? currencyId,
    int? bankId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? totalTransactions,
    CurrencyModel? currency,
    BankModel? bank,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      colorIndex: colorIndex ?? this.colorIndex,
      amount: amount ?? this.amount,
      minAmount: minAmount ?? this.minAmount,
      currencyId: currencyId ?? this.currencyId,
      bankId: bankId ?? this.bankId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      totalTransactions: totalTransactions ?? this.totalTransactions,
      currency: currency ?? this.currency,
      bank: bank ?? this.bank,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'colorIndex': colorIndex,
      'amount': amount,
      'minAmount': minAmount,
      'currencyId': currencyId,
      'bankId': bankId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'totalTransactions': totalTransactions,
      'currency': currency.toMap(),
      'bank': bank?.toMap(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
      description: map['description'] as String,
      colorIndex: map['colorIndex'] as int,
      amount: map['amount'] as double,
      minAmount: map['minAmount'] as double,
      currencyId: map['currencyId'] as int,
      bankId: map['bankId'] != null ? map['bankId'] as int : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
      totalTransactions: map['totalTransactions'] as int,
      currency: CurrencyModel.fromMap(map['currency'] as Map<String, dynamic>),
      bank: map['bank'] != null
          ? BankModel.fromMap(map['bank'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(id: $id, name: $name, icon: $icon, description: $description, colorIndex: $colorIndex, amount: $amount, minAmount: $minAmount, currencyId: $currencyId, bankId: $bankId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, totalTransactions: $totalTransactions, currency: $currency, bank: $bank)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.icon == icon &&
        other.description == description &&
        other.colorIndex == colorIndex &&
        other.amount == amount &&
        other.minAmount == minAmount &&
        other.currencyId == currencyId &&
        other.bankId == bankId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.totalTransactions == totalTransactions &&
        other.currency == currency &&
        other.bank == bank;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        icon.hashCode ^
        description.hashCode ^
        colorIndex.hashCode ^
        amount.hashCode ^
        minAmount.hashCode ^
        currencyId.hashCode ^
        bankId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        totalTransactions.hashCode ^
        currency.hashCode ^
        bank.hashCode;
  }
}
