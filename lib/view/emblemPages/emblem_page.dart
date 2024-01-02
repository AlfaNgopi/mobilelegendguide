import 'package:flutter/material.dart';
import 'package:mobilelegendguide/static_data.dart';

class EmblemPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;

  const EmblemPage({super.key});

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
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Role")
                      .length,
                  (index) => Image.asset(StaticData.emblems
                      .where((element) => element.tier == "Role")
                      .elementAt(index)
                      .iconDirectory),
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
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 1")
                      .length,
                  (index) => StaticData.emblems
                      .where((element) => element.tier == "Tier 1")
                      .elementAt(index)
                      .icon,
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
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 2")
                      .length,
                  (index) => StaticData.emblems
                      .where((element) => element.tier == "Tier 2")
                      .elementAt(index)
                      .icon,
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
                children: List.generate(
                  StaticData.emblems
                      .where((element) => element.tier == "Tier 3")
                      .length,
                  (index) => StaticData.emblems
                      .where((element) => element.tier == "Tier 3")
                      .elementAt(index)
                      .icon,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
