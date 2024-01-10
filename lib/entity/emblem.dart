import 'package:flutter/material.dart';

class Emblem {
  late Image icon;
  late String name, iconDirectory, description;
  late String tier;
  Map<String, dynamic>? statModifier = {};

  Emblem(
      {required this.name,
      required this.iconDirectory,
      required this.description,
      required this.tier,
      this.statModifier}) {
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
        'statModifier': statModifier,
      };

  static Emblem fromJson(Map<String, dynamic> json) => Emblem(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
        tier: json['tier'],
        statModifier: json['statModifier'],
      );
}
