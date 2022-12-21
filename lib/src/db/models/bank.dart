import 'package:hive/hive.dart';

part 'bank.g.dart';

@HiveType(typeId: 2)
class Bank {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? uuid;
  @HiveField(2)
  String name;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  DateTime? updatedAt;

  Bank({
    this.id,
    this.uuid,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });
}
