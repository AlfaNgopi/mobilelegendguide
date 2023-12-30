import 'package:flutter/material.dart';

class Item {
  late Image icon;
  String name;
  String subname;
  String type;
  String iconDirectory;
  String tips;
  Map<String, dynamic> statModifier;
  List<Map<dynamic, dynamic>> passives;
  double price = 0;

  Item({
    required this.name,
    this.subname = "",
    required this.type,
    required this.iconDirectory,
    required this.tips,
    this.statModifier = const {"Physical Attack": "70", "Movement Speed": "5"},
    this.passives = const [],
  }) {
    icon = Image.asset(
      iconDirectory,
      scale: 1.8,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'iconDirectory': iconDirectory,
        'description': tips,
        'type': type,
        'passives': passives,
        'statModifier': statModifier,
        'subname': subname,
      };

  static Item fromJson(Map<String, dynamic> json) => Item(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        tips: json['description'],
        type: json['type'],
        passives: (json['passives'] as List<dynamic>)
            .map((passive) => {
                  'name': passive['name'],
                  'description': passive['description'],
                })
            .toList(),
        statModifier: json['statModifier'] as Map<String, dynamic>,
        subname: json['subname'],
      );
}
