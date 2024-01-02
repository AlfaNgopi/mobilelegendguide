import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/emblem.dart';
import 'package:mobilelegendguide/static_data.dart';

class EmblemPage extends StatefulWidget {
  const EmblemPage({super.key});

  @override
  State<EmblemPage> createState() => _EmblemPageState();
}

class _EmblemPageState extends State<EmblemPage> {
  final Color cardsColor = Colors.blue;

  Emblem? roleEmblemSelected;
  Emblem? talent1Selected;
  Emblem? talent2Selected;
  Emblem? talent3Selected;

  @override
  Widget build(BuildContext context) {
    //this variable

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: const Text("Emblems"),
      ),
      body: ListView(children: [
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Column(
            children: [
              const Text("Role Emblem"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Role")
                      .length,
                  (index) => InkWell(
                    child: Image.asset(
                      StaticData.emblems
                          .where((element) => element.tier == "Role")
                          .elementAt(index)
                          .iconDirectory,
                      width: 50,
                    ),
                    onTap: () {
                      setState(() {
                        roleEmblemSelected = StaticData.emblems
                            .where((element) => element.tier == "Role")
                            .elementAt(index);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Column(
            children: [
              const Text("Tier 1 Emblem"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 1")
                      .length,
                  (index) => InkWell(
                      child: Image.asset(
                        StaticData.emblems
                            .where((element) => element.tier == "Tier 1")
                            .elementAt(index)
                            .iconDirectory,
                        width: 50,
                      ),
                      onTap: () {
                        setState(() {
                          talent1Selected = StaticData.emblems
                              .where((element) => element.tier == "Tier 1")
                              .elementAt(index);
                        });
                      }),
                ),
              )
            ],
          ),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Column(
            children: [
              const Text("Tier 2 Emblem"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 2")
                      .length,
                  (index) => InkWell(
                    child: Image.asset(
                      StaticData.emblems
                          .where((element) => element.tier == "Tier 2")
                          .elementAt(index)
                          .iconDirectory,
                      width: 50,
                    ),
                    onTap: () {
                      setState(() {
                        talent2Selected = StaticData.emblems
                            .where((element) => element.tier == "Tier 2")
                            .elementAt(index);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Column(
            children: [
              const Text("Tier 3 Emblem"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 3")
                      .length,
                  (index) => InkWell(
                    child: Image.asset(
                      StaticData.emblems
                          .where((element) => element.tier == "Tier 3")
                          .elementAt(index)
                          .iconDirectory,
                      width: 50,
                    ),
                    onTap: () {
                      setState(() {
                        talent3Selected = StaticData.emblems
                            .where((element) => element.tier == "Tier 3")
                            .elementAt(index);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: roleEmblemSelected != null
              ? Column(
                  children: [
                    Text(roleEmblemSelected!.name),
                    Text(roleEmblemSelected!.description),
                  ],
                )
              : const Text("Select Role Emblem"),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: talent1Selected != null
              ? Column(
                  children: [
                    Text(talent1Selected!.name),
                    Text(talent1Selected!.description),
                  ],
                )
              : const Text("Select Talent 1"),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: talent2Selected != null
              ? Column(
                  children: [
                    Text(talent2Selected!.name),
                    Text(talent2Selected!.description),
                  ],
                )
              : const Text("Select Talent 2"),
        ),
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: talent3Selected != null
              ? Column(
                  children: [
                    Text(talent3Selected!.name),
                    Text(talent3Selected!.description),
                  ],
                )
              : const Text("Select Talent 3"),
        )
      ]),
    );
  }
}
