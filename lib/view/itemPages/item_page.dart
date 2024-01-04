import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/static_data.dart';

class ItemPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;
  final Item item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    //this variable
    const EdgeInsetsGeometry cardsMargin =
        EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(children: [
        //*hro profile
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Padding(
            padding: StaticData.cardsPadding,
            child: Row(
              children: [
                Container(
                  // color: Colors.yellow,
                  padding: const EdgeInsets.only(right: 10),

                  child: Image.asset(
                    item.iconDirectory,
                    scale: 1,
                  ),
                ),
                Flexible(
                  // color: Colors.red,
                  // width: cardsWidth * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.name,
                            style: StaticData.itemTitleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Image.asset("asset/bp.png"),
                              Text(
                                item.price.toString(),
                                style: StaticData.priceTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        item.subname,
                      ),
                      Text(
                        item.type,
                        style: StaticData.itemTypeTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        // stats
        Container(
          color: cardsColor,
          margin: cardsMargin,
          padding: StaticData.cardsPadding,
          child: Column(
            children: [
              Text(
                "Stats Modifier",
                style: StaticData.sectionTitleTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          item.statModifier.length,
                          (index) =>
                              Text(item.statModifier.keys.elementAt(index))),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                          item.statModifier.length,
                          (index) => Text(
                              "${item.statModifier.values.elementAt(index)}")),
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
          padding: StaticData.cardsPadding,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  item.tips,
                  style: StaticData.itemTipsTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Text(
                "Unique Passive",
                style: StaticData.sectionTitleTextStyle,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    item.passives.length,
                    (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.passives[index]["name"]!,
                              style: StaticData.itemPassiveTitleTextStyle,
                            ),
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
