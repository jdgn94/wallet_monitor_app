import 'package:hive/hive.dart';

part 'currency.g.dart';

@HiveType(typeId: 0)
class Currency {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? uuid;
  @HiveField(2)
  String name;
  @HiveField(3)
  String symbol;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;

  Currency({
    this.id,
    this.uuid,
    required this.name,
    required this.symbol,
    this.createdAt,
    this.updatedAt,
  });
}
