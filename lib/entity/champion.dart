import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/lane_client.dart';
import 'package:mobilelegendguide/client/type_client.dart';
import 'package:mobilelegendguide/entity/build.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/stats.dart';
import 'package:mobilelegendguide/entity/type.dart';
import 'package:mobilelegendguide/static_data.dart';

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
  List<Build> builds;
  late List<Champion> strongAgainst = [];
  late List<Champion> weakAgainst = [];

  String? _laneName;
  String? _typeName;
  late List<dynamic> _strongAgainstNames;
  late List<dynamic> _weakAgainstNames;

  Champion({
    required this.championId,
    required this.name,
    required String laneName,
    required String typeName,
    required this.speciality,
    required this.profileDirectory,
    required this.stats,
    required this.emblem,
    required this.builds,
    required List<dynamic> strongAgainstNames,
    required List<dynamic> weakAgainstNames,
  }) {
    _laneName = laneName;
    _typeName = typeName;
    _strongAgainstNames = strongAgainstNames;
    _weakAgainstNames = weakAgainstNames;
    icon = Image.asset(
      profileDirectory,
    );

    setLaneFromStaticData(laneName);
    setTypeFromStaticData(typeName);
  }

  setType(String typeName) async {
    type = await TypeClient.fetchType(typeName);
  }

  setLane(String laneName) async {
    lane = await LaneClient.fetchLane(laneName);
  }

  setLaneFromStaticData(String laneName) {
    lane = StaticData.lanes.firstWhere((lane) => lane.name == laneName);
  }

  setTypeFromStaticData(String typeName) {
    type = StaticData.types.firstWhere((type) => type.name == typeName);
  }

  setStrongAgainstFromStaticData() {
    for (var strongAgainstName in _strongAgainstNames) {
      strongAgainst.add(StaticData.champions
          .firstWhere((champion) => champion.name == strongAgainstName));
    }
  }

  setWeakAgainstFromStaticData() {
    for (var weakAgainstName in _weakAgainstNames) {
      weakAgainst.add(StaticData.champions
          .firstWhere((champion) => champion.name == weakAgainstName));
    }
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
        'builds': builds.map((build) => build.toJson()).toList(),
        'strongAgainst': _strongAgainstNames,
        'weakAgainst': _weakAgainstNames
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
        builds: (json['builds'] as List<dynamic>)
            .map((build) => Build.fromJson(build))
            .toList(),
        strongAgainstNames: json['strongAgainst'],
        weakAgainstNames: json['weakAgainst'],
      );
}