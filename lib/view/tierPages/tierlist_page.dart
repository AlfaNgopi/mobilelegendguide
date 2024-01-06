// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/heroPages/champion_page.dart';

class TierListPage extends StatefulWidget {
  const TierListPage({super.key});

  @override
  State<TierListPage> createState() => _TierListPageState();
}

class _TierListPageState extends State<TierListPage> {
  List<Champion> champions = [];
  late int champCount = 0;
  bool isLoading = true;
  final Color cardsColor = Colors.blue;

  String selectedType = "All";

  List<String> tiers = ["SS", "S", "A", "B", "C", "D"];

  void refresh() async {
    // var championsFromDatabase = await ChampionClient.fetchAll();

    var championsFromStaticData = StaticData.champions;

    setState(() {
      champions = championsFromStaticData;
      champCount = champions.length;
      isLoading = false;
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double sideCardsMargin = 10;
    final double cardsWidth = width - sideCardsMargin * 2;

    const EdgeInsetsGeometry cardsMargin =
        EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Scaffold(
        backgroundColor: StaticData.backgroundColor,
        appBar: AppBar(
          title: const Text("Select Hero"),
        ),
        body: ListView(
          children: [
            // Search Container
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "Tier List",
                style: StaticData.titleTextStyle,
              ),
            ]),

            Container(
              color: cardsColor,
              margin: cardsMargin,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: buildTypeSelector(
                  StaticData.types.map((e) => e.name).toList(), cardsWidth),
            ),

            // List of Champions
            Container(
              color: StaticData.cardColor,
              margin: StaticData.cardsMargin,
              padding: StaticData.cardsPadding,
              child: Column(
                  children: List.generate(
                      tiers.length, (index) => BuildTier(tiers[index]))),
            ),
          ],
        ));
  }

  Container myContainer({required Widget child}) {
    const EdgeInsetsGeometry cardsMargin =
        EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Container(
      color: cardsColor,
      margin: cardsMargin,
      child: child,
    );
  }

  ListView pp() => ListView.builder(
      itemCount: champCount,
      itemBuilder: (context, index) {
        return buildChampionList(champions[index]);
      });

  Widget BuildTier(String tier) => Container(
        color: Colors.blue.shade200,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
              width: 50,
              child: Container(
                color: tier == "SS"
                    ? Colors.green
                    : tier == "S"
                        ? Colors.limeAccent
                        : tier == "A"
                            ? Colors.yellow
                            : tier == "B"
                                ? Colors.orange
                                : tier == "C"
                                    ? Colors.red
                                    : Colors.red.shade800,
                child: Center(
                  child: Text(
                    tier,
                    style: TextStyle(fontSize: 25), // TODO: Change to TextStyle
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  shrinkWrap: true,
                  children: [
                    for (var champ in champions
                        .where((element) => element.tier.tier == tier))
                      buildChampionList(champ)
                  ]),
            )
          ],
        ),
      );

  Widget buildChampionList(Champion champ) => SizedBox(
        width: 75,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(child: champ.icon),
        ),
      );

  Widget buildTypeSelector(List<String> list, double cardsWidth) {
    return Container(
        color: cardsColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(((list.length / 3).ceil()), (index) {
            int currentIndex = index * 3;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  list.length - currentIndex >= 3
                      ? 3
                      : list.length - currentIndex,
                  (index2) => buildTextButtonList(
                      list[currentIndex + index2], cardsWidth)),
            );
          }),
        ));
  }

  Widget buildTextButtonList(String itemName, double cardsWidth) => TextButton(
        onPressed: () {
          setState(() {
            selectedType = itemName;
            onFilter();
          });
        },
        child: SizedBox(
          width: cardsWidth / 4,
          child: Text(
            itemName,
            style: selectedType == itemName
                ? StaticData.selectTypeHeroActive
                : StaticData.selectTypeHero,
            textAlign: TextAlign.center,
          ),
        ),
      );

  void onFilter() {
    String query = searchController.text;

    print("mencari $query dengan tipe $selectedType");

    List<Champion> champsAsType;
    if (selectedType != "All") {
      champsAsType = StaticData.champions
          .where((champ) => champ.type
              .where((element) => element.name == selectedType)
              .isNotEmpty)
          .toList();
    } else {
      champsAsType = StaticData.champions;
    }

    List<Champion> hasilCari = champsAsType;
    if (query.isNotEmpty) {
      hasilCari = [];
      for (var champ in champsAsType) {
        if (champ.name.toLowerCase().contains(query.toLowerCase())) {
          hasilCari.add(champ);
        }
      }
    }

    setState(() {
      champions = hasilCari;
      champCount = champions.length;
    });
  }
}
