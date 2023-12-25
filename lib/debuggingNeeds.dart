// ignore: file_names
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/stats.dart';

void addDummyChampion() {
  ChampionClient.createChampion(Champion(
    championId: 1,
    profileDirectory: "asset/alucard.png",
    name: "Alucard",
    laneName: "EXP",
    typeName: "Fighter",
    stats: Stats(
        hp: 100,
        hpRegen: 100,
        mana: 100,
        manaRegen: 100,
        physicalAtk: 100,
        magicAtk: 100,
        physicalDef: 100,
        magicDef: 100,
        atkSpeed: 100,
        atkSpeedRatio: 90,
        movementSpeed: 100),
    emblem: EmblemSet(
      name: "Physical Emblem",
      iconDirectory: "asset/emblems/assassin-emblem.png",
      description: "desckosong",
      talent1Name: "fatal",
      talent2Name: "tenacity",
      talent3Name: "inspire",
    ),
    speciality: "desckosong",
  ));
}
