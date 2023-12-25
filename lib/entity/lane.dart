import 'package:flutter/material.dart';

class Lane {
  late Image icon;
  String name;
  String iconDirectory;
  String description;

  Lane({
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

  static Lane fromJson(Map<String, dynamic> json) => Lane(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
      );
}
