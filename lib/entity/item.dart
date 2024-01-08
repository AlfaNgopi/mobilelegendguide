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
  int price;

  Item({
    required this.name,
    this.subname = "",
    required this.type,
    required this.iconDirectory,
    required this.tips,
    this.statModifier = const {"Physical Attack": "70", "Movement Speed": "5"},
    this.passives = const [],
    required this.price,
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
        'price': price,
      };

  static Item fromJson(Map<String, dynamic> json) {
    try {
      return Item(
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
        price: json['price'],
      );
    } catch (e) {
      print(json['name']);
      print(e);
    }
    return Item(
      name: "null",
      iconDirectory: "iconDirectory",
      tips: "description",
      type: "type",
      passives: [],
      statModifier: {},
      subname: "subname",
      price: 0,
    );
  }
}
