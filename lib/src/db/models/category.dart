import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class Category {
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

  Category({
    this.id,
    this.uuid,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });
}
