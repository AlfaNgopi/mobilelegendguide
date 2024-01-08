// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/components/emblem_show.dart';

class ChampionPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;
  final Champion champion;

  const ChampionPage({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    //this variable
    final double width = MediaQuery.of(context).size.width;
    const double sideCardsMargin = 10;
    final double cardsWidth = width - sideCardsMargin * 2;
    const EdgeInsetsGeometry cardsMargin =
        EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: Text(champion.name),
      ),
      body: ListView(children: [
        //hro profile
        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              Text(champion.name, textScaleFactor: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.yellow,
                    width: cardsWidth / 2,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(champion.profileDirectory, scale: 0.6),
                  ),

                  //class lane name
                  SizedBox(
                    // color: Colors.green,
                    width: cardsWidth / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  champion.lane.icon,
                                  Text(champion.lane.name)
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: List.generate(champion.type.length,
                                    (index) => champion.type[index].icon),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text(champion.speciality),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        // stats
        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              const Text("Stats", textScaleFactor: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    width: cardsWidth / 2,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("HP"),
                        Text("Mana"),
                        Text("HP Regen"),
                        Text("Mana Regen"),
                        Text("Physical Attack"),
                        Text("Magical Attack"),
                        Text("Physical Defense"),
                        Text("Magical Defense"),
                        Text("Attack Speed"),
                        Text("Movement Speed"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: cardsWidth / 2,
                    child: Column(
                      children: [
                        Text(champion.stats.hp.toString()),
                        Text(champion.stats.mana.toString()),
                        Text(champion.stats.hpRegen.toString()),
                        Text(champion.stats.manaRegen.toString()),
                        Text(champion.stats.physicalAtk.toString()),
                        Text(champion.stats.magicAtk.toString()),
                        Text(champion.stats.physicalDef.toString()),
                        Text(champion.stats.magicDef.toString()),
                        Text(champion.stats.atkSpeed.toString()),
                        Text(champion.stats.movementSpeed.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Laning status
        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      StaticData.lanes.length,
                      (index) => Container(
                        color:
                            champion.lane.name == StaticData.lanes[index].name
                                ? Colors.yellow
                                : cardsColor,
                        child: StaticData.lanes[index].icon,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(champion.lane.description),
              ),
            ],
          ),
        ),

        // Class status
        Container(
          color: cardsColor,
          margin: cardsMargin,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      StaticData.types.length,
                      (index) => Container(
                        color: champion.type
                                .where((element) =>
                                    element.name ==
                                    StaticData.types[index].name)
                                .isNotEmpty
                            ? Colors.yellow
                            : cardsColor,
                        child: StaticData.types[index].icon,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(champion.type.first.description),
              ),
            ],
          ),
        ),

        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              const Text("Skills", textScaleFactor: 2),
              Column(
                children: List.generate(
                    champion.skills.length,
                    (index) => Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: cardsWidth * 0.3,
                                  child: champion.skills[index].icon,
                                ),
                                SizedBox(
                                  width: cardsWidth * 0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        champion.skills[index].name,
                                        textScaleFactor: 1.5,
                                      ),
                                      Text(
                                        champion.skills[index].description,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            index == champion.skills.length - 1
                                ? Container()
                                : Divider(
                                    color: StaticData.backgroundColor,
                                    thickness: 3,
                                    endIndent: 20,
                                    indent: 20,
                                  )
                          ],
                        )),
              ),
            ],
          ),
        ),

        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              const Text("TEAM INFLUENCE", textScaleFactor: 2),
              SizedBox(
                width: 200,
                height: 200,
                child: RadarChart(
                  ticks: [2, 4, 6, 8, 10, 12],
                  features: [
                    "PUSH",
                    "EARLY TO MIDGAME",
                    "PICK-OFF",
                    "TEAM FIGHT",
                    "LATE GAME"
                  ],
                  data: [champion.getChampInfluence()],
                  outlineColor: Colors.transparent,
                  axisColor: Colors.red,
                  sides: 5,
                  featuresTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  ticksTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Rekomendasi Build
        Container(
          margin: cardsMargin,
          color: cardsColor,
          child: Column(
            children: [
              const Text("Rekomendasi Build", textScaleFactor: 1.5),
              SizedBox(
                width: cardsWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    champion.builds[0].item1.icon,
                    champion.builds[0].item2.icon,
                    champion.builds[0].item3.icon,
                    champion.builds[0].item4.icon,
                    champion.builds[0].item5.icon,
                    champion.builds[0].item6.icon,
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    champion.builds[0].battleSpell.icon,
                  ],
                ),
              ),
            ],
          ),
        ),

        //Emblem
        Container(
          margin: cardsMargin,
          color: cardsColor,
          padding: const EdgeInsets.all(8.0),
          child: EmblemShow(cardsWidth, champion.emblem),
        ),

        //Strong against
        Container(
          margin: cardsMargin,
          color: cardsColor,
          child: Column(
            children: [
              const Text("Strong Against", textScaleFactor: 1.5),
              SizedBox(
                width: cardsWidth,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      champion.strongAgainst.length,
                      (index) => champion.strongAgainst[index].icon,
                    )),
              ),
            ],
          ),
        ),

        //weak against
        Container(
          margin: cardsMargin,
          color: cardsColor,
          child: Column(
            children: [
              const Text("Weak Against", textScaleFactor: 1.5),
              SizedBox(
                width: cardsWidth,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      champion.weakAgainst.length,
                      (index) => champion.weakAgainst[index].icon,
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
