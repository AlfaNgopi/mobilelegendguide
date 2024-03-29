// ignore: file_names
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/client/emblem_client.dart';
import 'package:mobilelegendguide/client/item_client.dart';
import 'package:mobilelegendguide/client/spell_client.dart';
import 'package:mobilelegendguide/entity/build.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/emblem.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';
import 'package:mobilelegendguide/entity/influence.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/entity/skill.dart';
import 'package:mobilelegendguide/entity/stats.dart';
import 'package:mobilelegendguide/entity/tier.dart';

void addDummyChampion() {
  ChampionClient.createChampion(
    Champion(
      profileDirectory: "asset/alucard.png",
      name: "Alucard",
      laneName: "EXP",
      typeName: ["Fighter", "Assassin"],
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
          movementSpeed: 100),
      emblem: EmblemSet(
        roleEmblemName: "Assassin",
        talent1Name: "fatal",
        talent2Name: "tenacity",
        talent3Name: "inspire",
      ),
      speciality: "desckosong",
      builds: [
        Build(
            author: "Build 1",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong",
            battleSpellName: "Sprint"),
        Build(
            author: "Build 2",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong",
            battleSpellName: "Sprint"),
        Build(
            author: "Build 3",
            itemName1: "Holy_Crystal",
            itemName2: "Holy_Crystal",
            itemName3: "Holy_Crystal",
            itemName4: "Holy_Crystal",
            itemName5: "Holy_Crystal",
            itemName6: "Holy_Crystal",
            description: "desckosong",
            battleSpellName: "Sprint"),
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
      tier:
          Tier(tier: "S", poin: 4.65, winrate: 50, pickrate: 2.2, banrate: 13),
    ),
  );
}

void addDummyItem() {
  ItemClient.createItem(
    Item(
        name: "Holy_Crystal",
        subname: "Scalable Magic Power",
        type: "Magic",
        iconDirectory: "asset/items/Holy_Crystal.png",
        tips: "No Tips",
        statModifier: {"Physical Attack": "70", "Movement Speed": "5"},
        passives: [
          {
            "name": "Mystery",
            "description":
                "Increase magic attack by 21%-35% (Scales with level)"
          }
        ],
        price: 2000),
  );
}

void addDummyEmblem() {
  EmblemClient.createEmblem(Emblem(
      name: "Rupture",
      iconDirectory: "asset/emblems/rupture-emblem-mlbb.png",
      description: "Gain 5 Adaptive Penetration",
      tier: "Tier 1",
      statModifier: {"Adaptive Penetration": 5}));
}

void uploadDataWinrate() {
  ChampionClient.updateDataWinrate();
}

void uploadDataChampion() {
  ChampionClient.createChampionFromJson();
}

void uploadDataItem() {
  ItemClient.createItemFromJson();
}

void uploadDataEmblem() {
  EmblemClient.createEmblemFromJson();
}

void uploadDataSpell() {
  SpellClient.createSpellFromJson();
}
