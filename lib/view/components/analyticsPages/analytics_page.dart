// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/components/analyticsPages/takechampion_page.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  final Color cardsColor = Colors.blue;

  List<Champion?> blueTeam = [null, null, null, null, null];
  List<Champion?> redTeam = [null, null, null, null, null];

  List<num> blueTeamStats = [0, 0, 0, 0, 0];
  List<num> redTeamStats = [0, 0, 0, 0, 0];

  void refresh() {
    setState(() {
      setStats();
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //this variable

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: ListView(children: [
        Card(
            color: StaticData.cardColor,
            margin: StaticData.cardsMargin,
            child: Column(children: [
              const Text("Blue Team"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) => Container(
                      width: 60,
                      height: 120,
                      color: Colors.black87,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            child: InkWell(
                                child: blueTeam[index] == null
                                    ? Center(
                                        child: const Text(
                                          "Select Champion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : blueTeam[index]!.icon,
                                onTap: () async {
                                  blueTeam[index] = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TakeChampion()),
                                  );
                                  refresh();
                                }),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          StaticData.lanes[index].icon,
                          Text(
                            StaticData.lanes[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ))
            ])),
        Card(
            color: StaticData.cardColor,
            margin: StaticData.cardsMargin,
            child: Column(children: [
              const Text("Red Team"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) => Container(
                      width: 60,
                      height: 120,
                      color: Colors.black87,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            child: InkWell(
                                child: redTeam[index] == null
                                    ? Center(
                                        child: const Text(
                                          "Select Champion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : redTeam[index]!.icon,
                                onTap: () async {
                                  redTeam[index] = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TakeChampion()),
                                  );
                                  refresh();
                                }),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          StaticData.lanes[index].icon,
                          Text(
                            StaticData.lanes[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ))
            ])),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Column(
            children: [
              Row(children: [
                Column(children: [
                  const Text("Blue Team"),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: RadarChart(
                      ticks: const [2, 4, 6, 8, 10, 12],
                      features: [
                        "PUSH",
                        "EARLY TO MIDGAME",
                        "PICK-OFF",
                        "TEAM FIGHT",
                        "LATE GAME"
                      ],
                      data: [
                        blueTeamStats,
                      ],
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
                ]),
                Text("VS"),
                Column(children: [
                  const Text("Red Team"),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: RadarChart(
                      ticks: const [2, 4, 6, 8, 10, 12],
                      features: [
                        "PUSH",
                        "EARLY TO MIDGAME",
                        "PICK-OFF",
                        "TEAM FIGHT",
                        "LATE GAME"
                      ],
                      data: [
                        redTeamStats,
                      ],
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
                ]),
              ]),
              SizedBox(
                child: Column(
                    children: List.generate(
                  5,
                  (index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: blueTeamStats[index] != 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: blueTeamStats[index] * 5,
                                        height: 20,
                                        color: Colors.yellow,
                                        child: Text(
                                          blueTeamStats[index].toString(),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                          ),
                          Center(
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                      [
                                        "PUSH",
                                        "EARLY TO MIDGAME",
                                        "PICK-OFF",
                                        "TEAM FIGHT",
                                        "LATE GAME"
                                      ][index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: redTeamStats[index] != 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: redTeamStats[index] * 5,
                                        height: 20,
                                        color: Colors.yellow,
                                        child: Text(
                                          redTeamStats[index].toString(),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            setStats();
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }

  setStats() {
    blueTeamStats = [0, 0, 0, 0, 0];
    redTeamStats = [0, 0, 0, 0, 0];
    for (int i = 0; i < 5; i++) {
      blueTeamStats[0] +=
          blueTeam[i] != null ? blueTeam[i]!.influence.push / 5 : 0;
      blueTeamStats[1] +=
          blueTeam[i] != null ? blueTeam[i]!.influence.earlytomidgame / 5 : 0;
      blueTeamStats[2] +=
          blueTeam[i] != null ? blueTeam[i]!.influence.pickoff / 5 : 0;
      blueTeamStats[3] +=
          blueTeam[i] != null ? blueTeam[i]!.influence.teamfight / 5 : 0;
      blueTeamStats[4] +=
          blueTeam[i] != null ? blueTeam[i]!.influence.lategame / 5 : 0;
    }
    for (int i = 0; i < 5; i++) {
      redTeamStats[0] +=
          redTeam[i] != null ? redTeam[i]!.influence.push / 5 : 0;
      redTeamStats[1] +=
          redTeam[i] != null ? redTeam[i]!.influence.earlytomidgame / 5 : 0;
      redTeamStats[2] +=
          redTeam[i] != null ? redTeam[i]!.influence.pickoff / 5 : 0;
      redTeamStats[3] +=
          redTeam[i] != null ? redTeam[i]!.influence.teamfight / 5 : 0;
      redTeamStats[4] +=
          redTeam[i] != null ? redTeam[i]!.influence.lategame / 5 : 0;
    }
  }
}
