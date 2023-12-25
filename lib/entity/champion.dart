import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/lane_client.dart';
import 'package:mobilelegendguide/client/type_client.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/stats.dart';
import 'package:mobilelegendguide/entity/type.dart';

class Champion {
  late Image icon;
  int championId;
  String name;
  late Type type;
  late Lane lane;
  String speciality;
  Stats stats;
  String profileDirectory;
  EmblemSet emblem;

  String? _laneName;
  String? _typeName;

  Champion({
    required this.championId,
    required this.name,
    required String laneName,
    required String typeName,
    required this.speciality,
    required this.profileDirectory,
    required this.stats,
    required this.emblem,
  }) {
    _laneName = laneName;
    _typeName = typeName;
    icon = Image.asset(
      profileDirectory,
      scale: 0.6,
    );

    setLane(laneName);
    setType(typeName);
  }

  setType(String typeName) async {
    type = await TypeClient.fetchType(typeName);
  }

  setLane(String laneName) async {
    lane = await LaneClient.fetchLane(laneName);
  }

  Map<String, dynamic> toJson() => {
        'championId': championId,
        'name': name,
        'type': _typeName,
        'lane': _laneName,
        'speciality': speciality,
        'profileDirectory': profileDirectory,
        'stats': stats.toJson(),
        'emblem': emblem.toJson(),
      };

  static Champion fromJson(Map<String, dynamic> json) => Champion(
        championId: json['championId'],
        name: json['name'],
        typeName: json['type'],
        laneName: json['lane'],
        speciality: json['speciality'],
        profileDirectory: json['profileDirectory'],
        stats: Stats.fromJson(json['stats']),
        emblem: EmblemSet.fromJson(json['emblem']),
      );
}
