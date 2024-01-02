import 'package:mobilelegendguide/client/emblem_client.dart';
import 'package:mobilelegendguide/entity/emblem.dart';
import 'package:mobilelegendguide/static_data.dart';

class EmblemSet {
  late Emblem roleEmblem, talent1, talent2, talent3;

  String? _roleEmblemName, _talent1Name, _talent2Name, _talent3Name;

  EmblemSet({
    required String roleEmblemName,
    required String talent1Name,
    required String talent2Name,
    required String talent3Name,
  }) {
    _roleEmblemName = roleEmblemName;
    _talent1Name = talent1Name;
    _talent2Name = talent2Name;
    _talent3Name = talent3Name;

    setEmblemsFromStaticData(
        roleEmblemName, talent1Name, talent2Name, talent3Name);
  }

  setEmblems(String roleEmblemName, String talent1Name, String talent2Name,
      String talent3Name) async {
    roleEmblem = await EmblemClient.fetchEmblem(roleEmblemName);
    talent1 = await EmblemClient.fetchEmblem(talent1Name);
    talent2 = await EmblemClient.fetchEmblem(talent2Name);
    talent3 = await EmblemClient.fetchEmblem(talent3Name);
  }

  setEmblemsFromStaticData(String roleEmblemName, String talent1Name,
      String talent2Name, String talent3Name) {
    roleEmblem = StaticData.emblems
        .firstWhere((emblem) => emblem.name == roleEmblemName);
    talent1 =
        StaticData.emblems.firstWhere((emblem) => emblem.name == talent1Name);
    talent2 =
        StaticData.emblems.firstWhere((emblem) => emblem.name == talent2Name);
    talent3 =
        StaticData.emblems.firstWhere((emblem) => emblem.name == talent3Name);
  }

  Map<String, dynamic> toJson() => {
        'roleEmblem': _roleEmblemName,
        'talent1': _talent1Name,
        'talent2': _talent2Name,
        'talent3': _talent3Name,
      };

  static EmblemSet fromJson(Map<String, dynamic> json) => EmblemSet(
        roleEmblemName: json['roleEmblem'],
        talent1Name: json['talent1'],
        talent2Name: json['talent2'],
        talent3Name: json['talent3'],
      );
}
