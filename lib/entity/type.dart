import 'package:flutter/material.dart';

class Type {
  late Image icon;
  late String name, iconDirectory, description;

  Type(
      {required this.name,
      required this.iconDirectory,
      required this.description}) {
    icon = Image.asset(
      iconDirectory,
      scale: 1.8,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'icondir': iconDirectory,
        'desc': description,
      };

  static Type fromJson(Map<String, dynamic> json) => Type(
        name: json['name'],
        iconDirectory: json['icondir'],
        description: json['desc'],
      );
}
