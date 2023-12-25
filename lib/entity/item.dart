import 'package:flutter/material.dart';

class Item {
  late Image icon;
  String name;
  String iconDirectory;
  String description;

  Item({
    required this.name,
    required this.iconDirectory,
    required this.description,
  }) {
    icon = Image.asset(
      iconDirectory,
      scale: 1.8,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'iconDirectory': iconDirectory,
        'description': description,
      };

  static Item fromJson(Map<String, dynamic> json) => Item(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
      );
}
