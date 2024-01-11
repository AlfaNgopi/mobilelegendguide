import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/lane_client.dart';
import 'package:mobilelegendguide/client/type_client.dart';
import 'package:mobilelegendguide/entity/build.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/influence.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/skill.dart';
import 'package:mobilelegendguide/entity/stats.dart';
import 'package:mobilelegendguide/entity/tier.dart';
import 'package:mobilelegendguide/entity/type.dart';
import 'package:mobilelegendguide/static_data.dart';

class Champion {
  late Image icon;

  String name;
  List<Type> type = [];
  late Lane lane;
  String speciality;
  Stats stats;
  List<Skill> skills = [];
  Influence influence;
  String profileDirectory;
  EmblemSet emblem;
  List<Build> builds;
  late List<Champion> strongAgainst = [];
  late List<Champion> weakAgainst = [];

  Tier tier;

  String? _laneName;
  List<dynamic>? _typeName;
  late List<dynamic> _strongAgainstNames;
  late List<dynamic> _weakAgainstNames;

  Champion({
    required this.name,
    required String laneName,
    required List<dynamic> typeName,
    required this.speciality,
    required this.profileDirectory,
    required this.stats,
    this.skills = const [],
    required this.influence,
    required this.emblem,
    required this.builds,
    required List<dynamic> strongAgainstNames,
    required List<dynamic> weakAgainstNames,
    required this.tier,
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

  setType(List<String> typeName) async {
    type = [];
    for (String typ in typeName) {
      type.add(await TypeClient.fetchType(typ));
    }
  }

  setLane(String laneName) async {
    lane = await LaneClient.fetchLane(laneName);
  }

  setLaneFromStaticData(String laneName) {
    lane = StaticData.lanes.firstWhere((lane) => lane.name == laneName);
  }

  setTypeFromStaticData(List<dynamic> typeName) {
    type = [];
    for (String typ in typeName) {
      var temp = StaticData.types.firstWhere(
        (type) => type.name == typ,
        orElse: () => Type(
            name: "null",
            iconDirectory: "iconDirectory",
            description: "description"),
      );
      if (temp.name != "null") {
        type.add(temp);
      }
    }
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

  List<double> getChampInfluence() {
    return influence.getChampInfluence();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': _typeName,
        'lane': _laneName,
        'speciality': speciality,
        'profileDirectory': profileDirectory,
        'stats': stats.toJson(),
        'skills': skills.map((skill) => skill.toJson()).toList(),
        'influence': influence.toJson(),
        'emblem': emblem.toJson(),
        'builds': builds.map((build) => build.toJson()).toList(),
        'strongAgainst': _strongAgainstNames,
        'weakAgainst': _weakAgainstNames,
        'tier': tier.toJson()
      };

  static Champion fromJson(Map<String, dynamic> json) => Champion(
        name: json['name'],
        typeName: json['type'],
        laneName: json['lane'],
        speciality: json['speciality'],
        profileDirectory: json['profileDirectory'],
        stats: Stats.fromJson(json['stats']),
        skills: (json['skills'] as List<dynamic>)
            .map((skill) => Skill.fromJson(skill))
            .toList(),
        influence: Influence.fromJson(json['influence']),
        emblem: EmblemSet.fromJson(json['emblems']),
        builds: (json['builds'] as List<dynamic>)
            .map((build) => Build.fromJson(build))
            .toList(),
        strongAgainstNames: json['strongAgainsts'],
        weakAgainstNames: json['weakAgainsts'],
        tier: Tier.fromJson(json['tier']),
      );
}
