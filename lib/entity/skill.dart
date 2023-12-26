import 'package:flutter/material.dart';

class Skill {
  late Image icon;
  late String name, iconDirectory, description;
  bool passive;
  String? cooldown;
  String? manaCost; // aka energy cost

  Skill({
    required this.name,
    required this.iconDirectory,
    required this.description,
    this.passive = false,
    this.cooldown,
    this.manaCost,
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
        'passive': passive,
        'cooldown': cooldown,
        'manaCost': manaCost,
      };

  static Skill fromJson(Map<String, dynamic> json) => Skill(
        name: json['name'],
        iconDirectory: json['iconDirectory'],
        description: json['description'],
        passive: json['passive'],
        cooldown: json['cooldown'],
        manaCost: json['manaCost'],
      );
}
