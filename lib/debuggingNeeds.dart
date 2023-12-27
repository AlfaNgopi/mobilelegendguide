// ignore: file_names
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/entity/build.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/influence.dart';
import 'package:mobilelegendguide/entity/skill.dart';
import 'package:mobilelegendguide/entity/stats.dart';

void addDummyChampion() {
  ChampionClient.createChampion(
    Champion(
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
      builds: [
        Build(
            name: "Build 1",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong"),
        Build(
            name: "Build 2",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong"),
        Build(
            name: "Build 3",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong"),
      ],
      strongAgainstNames: ["Alucard", "Alucard", "Alucard"],
      weakAgainstNames: ["Alucard", "Alucard", "Alucard"],
      skills: [
        Skill(
          name: "Pursuit",
          iconDirectory: "asset/skills/Alucard_Pursuit.png",
          description:
              "After each skill cast, his next Basic Attack allows him to dash to the target's location &amp; (140% Total Physical Attack) Physical Damage.",
          passive: true,
        ),
        Skill(
          name: "Groundsplitter",
          iconDirectory: "asset/skills/Alucard_Groundsplitter.png",
          description:
              "Alucard rolls to the target location and slams his blade on the ground, dealing 270 / 290 / 310 / 330 / 350 / 370 (+110% Extra Physical Attack)  to enemies hit and slowing them by 40% for 2s.",
          cooldown: " 9.5 / 9.1 / 8.7 / 8.3 / 7.9 / 7.5",
        ),
        Skill(
            name: "Whirling Smash",
            iconDirectory: "asset/skills/Alucard_Whirling_Smash.png",
            description:
                "Alucard swings his sword in a wide circle, dealing 250 / 280 / 310 / 340 / 370 / 400 (+100% Total Physical Attack) Physical Damage to surrounding enemies and slowing them by 60% for 1s.",
            cooldown: "5.0"),
        Skill(
            name: "Fission Wave",
            iconDirectory: "asset/skills/Alucard_Fission_Wave.png",
            description:
                "Alucard charges forward and launches a Fission Wave, dealing 350 / 400 / 450 (+120% Total Physical Attack) Physical Damage to enemies in its path.",
            cooldown: " 40.0 / 35.0 / 30.0"),
      ],
      influence: Influence(
          earlytomidgame: 9, lategame: 7, teamfight: 3, pickoff: 6, push: 6),
    ),
  );
}
