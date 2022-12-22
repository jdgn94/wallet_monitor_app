import 'dart:io';
import 'dart:convert';

import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  Id id = Isar.autoIncrement;
  @Index(unique: true, caseSensitive: true)
  String uuid;
  @Index(unique: true, caseSensitive: true)
  String name;
  String operation;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.uuid,
    required this.name,
    required this.operation,
    required this.createdAt,
    required this.updatedAt,
  });

  // jsonToClass()
}
