import 'dart:convert';
import 'dart:ui';

class BankModel {
  int id;
  String name;
  String icon;
  String iconCategory;
  Color color;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int totalAccounts;
  BankModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconCategory,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.totalAccounts,
  });

  BankModel copyWith({
    int? id,
    String? name,
    String? icon,
    String? iconCategory,
    Color? color,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? totalAccounts,
  }) {
    return BankModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconCategory: iconCategory ?? this.iconCategory,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      totalAccounts: totalAccounts ?? this.totalAccounts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'iconCategory': iconCategory,
      'color': color.value,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'totalAccounts': totalAccounts,
    };
  }

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
      iconCategory: map['iconCategory'] as String,
      color: Color(map['color'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
      totalAccounts: map['totalAccounts'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankModel.fromJson(String source) =>
      BankModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BankModel(id: $id, name: $name, icon: $icon, iconCategory: $iconCategory, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, totalAccounts: $totalAccounts)';
  }

  @override
  bool operator ==(covariant BankModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.icon == icon &&
        other.iconCategory == iconCategory &&
        other.color == color &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.totalAccounts == totalAccounts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        icon.hashCode ^
        iconCategory.hashCode ^
        color.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        totalAccounts.hashCode;
  }
}
