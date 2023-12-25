import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/emblem_client.dart';
import 'package:mobilelegendguide/entity/emblem.dart';

class EmblemSet {
  late Image icon;
  late String name, iconDirectory, description;

  late Emblem talent1, talent2, talent3;

  String? _talent1Name, _talent2Name, _talent3Name;

  EmblemSet({
    required this.name,
    required this.iconDirectory,
    required this.description,
    required String talent1Name,
    required String talent2Name,
    required String talent3Name,
  }) {
    icon = Image.asset(
      iconDirectory,
      scale: 1.8,
    );

    _talent1Name = talent1Name;
    _talent2Name = talent2Name;
    _talent3Name = talent3Name;

    setEmblems(talent1Name, talent2Name, talent3Name);
  }

  setEmblems(String talent1Name, String talent2Name, String talent3Name) async {
    talent1 = await EmblemClient.fetchEmblem(talent1Name);
    talent2 = await EmblemClient.fetchEmblem(talent2Name);
    talent3 = await EmblemClient.fetchEmblem(talent3Name);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'icondir': iconDirectory,
        'desc': description,
        'talent1': _talent1Name,
        'talent2': _talent2Name,
        'talent3': _talent3Name,
      };

  static EmblemSet fromJson(Map<String, dynamic> json) => EmblemSet(
        name: json['name'],
        iconDirectory: json['icondir'],
        description: json['desc'],
        talent1Name: json['talent1'],
        talent2Name: json['talent2'],
        talent3Name: json['talent3'],
      );
}
