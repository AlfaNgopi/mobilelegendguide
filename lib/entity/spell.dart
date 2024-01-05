import 'package:flutter/material.dart';

class Spell {
  late Image icon;
  String name;
  String iconDirectory;
  String description;

  Spell({
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

  static Spell fromJson(Map<String, dynamic> json) => Spell(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
      );
}
