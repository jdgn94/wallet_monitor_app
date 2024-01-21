import 'dart:convert';

class BankModel {
  int id;
  String name;
  String icon;
  int colorIndex;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int totalAccounts;
  BankModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.colorIndex,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.totalAccounts,
  });

  BankModel copyWith({
    int? id,
    String? name,
    String? icon,
    int? colorIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? totalAccounts,
  }) {
    return BankModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      colorIndex: colorIndex ?? this.colorIndex,
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
      'colorIndex': colorIndex,
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
      colorIndex: map['colorIndex'] as int,
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
    return 'BankModel(id: $id, name: $name, icon: $icon, colorIndex: $colorIndex, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, totalAccounts: $totalAccounts)';
  }

  @override
  bool operator ==(covariant BankModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.icon == icon &&
        other.colorIndex == colorIndex &&
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
        colorIndex.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        totalAccounts.hashCode;
  }
}
