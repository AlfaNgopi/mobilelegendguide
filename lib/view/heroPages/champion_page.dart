import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/view/components/emblem_show.dart';

class ChampionPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;
  final Champion champion;

  final Color backgroundColor = const Color.fromRGBO(0, 119, 182, 100);
  ChampionPage({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    //this variable
    final double width = MediaQuery.of(context).size.width;
    const double sideCardsMargin = 10;
    final double cardsWidth = width - sideCardsMargin * 2;
    const EdgeInsetsGeometry cardsMargin =
        EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Scaffold(
      backgroundColor: backgroundColor,
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
              Container(
                child: Row(
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
                    Container(
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
                                  children: [
                                    champion.type.icon,
                                    Text(champion.type.name),
                                  ],
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
              ),
              Container(
                //color: Colors.white12,
                child: Row(
                  children: [
                    Container(
                      //color: Colors.white,
                      width: cardsWidth / 3,
                      child: Row(
                        children: [
                          Text("BP"),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.red,
                      width: cardsWidth / 3,
                      child: Row(
                        children: [
                          Text("Diamond"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: cardsWidth / 3,
                      child: Row(
                        children: [
                          Text("Ticket"),
                        ],
                      ),
                    )
                  ],
                ),
              )
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
                        Text("Attack Speed Ratio"),
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
                        Text(champion.stats.atkSpeedRatio.toString()),
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
                  children: [
                    Container(
                      color: champion.lane.name == "EXP"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.lane.icon,
                      ),
                    ),
                    Container(
                      color: champion.lane.name == "GOLD"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.lane.icon,
                      ),
                    ),
                    Container(
                      color: champion.lane.name == "MID"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.lane.icon,
                      ),
                    ),
                    Container(
                      color: champion.lane.name == "JUNGLE"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.lane.icon,
                      ),
                    ),
                    Container(
                      color: champion.lane.name == "ROAM"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.lane.icon,
                      ),
                    ),
                  ],
                ),
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
                  children: [
                    Container(
                      color: champion.type.name == "FIGHTER"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                    Container(
                      color: champion.type.name == "MARKSMAN"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                    Container(
                      color: champion.type.name == "MAGE"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                    Container(
                      color: champion.type.name == "ASSASIN"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                    Container(
                      color: champion.type.name == "TANK"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                    Container(
                      color: champion.type.name == "SUPPORT"
                          ? Colors.yellow
                          : cardsColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: champion.type.icon,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(champion.type.description),
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
            ],
          ),
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
                  children: [],
                ),
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
                  children: [],
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
        )
      ]),
    );
  }
}
