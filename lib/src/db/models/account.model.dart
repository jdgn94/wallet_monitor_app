// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:wallet_monitor/src/db/models/bank.model.dart';
import 'package:wallet_monitor/src/db/models/currency.model.dart';

class AccountModel {
  int id;
  String name;
  String icon;
  String iconCategory;
  String description;
  Color color;
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
  AccountModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconCategory,
    required this.description,
    required this.color,
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

  AccountModel copyWith({
    int? id,
    String? name,
    String? icon,
    String? iconCategory,
    String? description,
    Color? color,
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
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconCategory: iconCategory ?? this.iconCategory,
      description: description ?? this.description,
      color: color ?? this.color,
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
      'iconCategory': iconCategory,
      'description': description,
      'color': color.value,
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

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
      iconCategory: map['iconCategory'] as String,
      description: map['description'] as String,
      color: Color(map['color'] as int),
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

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, icon: $icon, iconCategory: $iconCategory, description: $description, color: $color, amount: $amount, minAmount: $minAmount, currencyId: $currencyId, bankId: $bankId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, totalTransactions: $totalTransactions, currency: $currency, bank: $bank)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.icon == icon &&
        other.iconCategory == iconCategory &&
        other.description == description &&
        other.color == color &&
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
        iconCategory.hashCode ^
        description.hashCode ^
        color.hashCode ^
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
