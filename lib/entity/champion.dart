import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/type.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/stats.dart';

class Champion {
  int championId;
  String name;
  Type type;
  Lane lane;
  String speciality;
  Stats stats;
  String profileDirectory;
  EmblemSet emblem;
  // Map<String, dynamic> stats;

  Champion({
    required this.championId,
    required this.name,
    required this.type,
    required this.lane,
    required this.speciality,
    required this.profileDirectory,
    required this.stats,
    required this.emblem,
    // required this.stats,
  });

  Map<String, dynamic> toJson() => {
        'championId': championId,
        'name': name,
        'type': type.toJson(),
        'lane': lane.toJson(),
        'speciality': speciality,
        'profileDirectory': profileDirectory,
        'stats': stats.toJson(),
        'emblem': emblem.toJson(),
      };

  static Champion fromJson(Map<String, dynamic> json) => Champion(
        championId: json['championId'],
        name: json['name'],
        type: Type.fromJson(json['type']),
        lane: Lane.fromJson(json['lane']),
        speciality: json['speciality'],
        profileDirectory: json['profileDirectory'],
        stats: Stats.fromJson(json['stats']),
        emblem: EmblemSet.fromJson(json['emblem']),
        // stats: json['stats'],
      );
}
