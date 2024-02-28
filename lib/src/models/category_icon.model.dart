// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wallet_monitor/src/helper/constants/custom_icons.dart';

class CategoryIcon {
  final String name;
  final String url;
  CategoryIcon({
    required this.name,
    required this.url,
  });

  CategoryIcon copyWith({
    String? name,
    String? url,
  }) {
    return CategoryIcon(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory CategoryIcon.fromMap(Map<String, dynamic> map) {
    return CategoryIcon(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryIcon.fromJson(String source) =>
      CategoryIcon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryIcon(name: $name, url: $url)';

  @override
  bool operator ==(covariant CategoryIcon other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

List<CategoryIcon> CategoryIconFromStringList(
        List<String> icons, String iconCategory) =>
    icons
        .map((icon) =>
            CategoryIcon(name: icon, url: getCustomIconUrl(icon, iconCategory)))
        .toList();
