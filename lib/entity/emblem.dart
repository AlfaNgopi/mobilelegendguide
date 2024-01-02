import 'package:flutter/material.dart';

class Emblem {
  late Image icon;
  late String name, iconDirectory, description;
  late String tier;

  Emblem(
      {required this.name,
      required this.iconDirectory,
      required this.description,
      required this.tier}) {
    icon = Image.asset(
      iconDirectory,
      scale: 1.8,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'iconDirectory': iconDirectory,
        'description': description,
        'tier': tier,
      };

  static Emblem fromJson(Map<String, dynamic> json) => Emblem(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
        tier: json['tier'],
      );
}
