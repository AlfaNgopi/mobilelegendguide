import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/components/emblem_show.dart';

class ItemPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;
  final Item item;

  ItemPage({super.key, required this.item});

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
        title: Text(item.name),
      ),
      body: ListView(children: [
        //hro profile
        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              Text(item.name, textScaleFactor: 3),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.yellow,
                      width: cardsWidth / 2,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(item.iconDirectory, scale: 0.6),
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
                                  child: Text(item.type)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Text(item.subname),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          item.statModifier.length,
                          (index) => Text(
                              "${item.statModifier.keys.elementAt(index)} : ${item.statModifier.values.elementAt(index)}")),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          color: cardsColor,
          margin: cardsMargin,
          child: Column(
            children: [
              Text(item.tips),
              const Text("Unique Passive", textScaleFactor: 2),
              Column(
                children: List.generate(
                    item.passives.length,
                    (index) => Column(
                          children: [
                            Text(item.passives[index]["name"]!,
                                textScaleFactor: 1.5),
                            Text(item.passives[index]["description"]!),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
