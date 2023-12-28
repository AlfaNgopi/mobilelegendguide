import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/heroPages/champion_page.dart';

class ChampionSelectPage extends StatefulWidget {
  const ChampionSelectPage({super.key, required this.title});

  final String title;

  @override
  State<ChampionSelectPage> createState() => _ChampionSelectPageState();
}

class _ChampionSelectPageState extends State<ChampionSelectPage> {
  List<Champion> champions = [];
  late int champCount = 0;
  bool isLoading = true;
  final Color cardsColor = Colors.blue;

  String selectedType = "All";

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
    final Color backgroundColor = const Color.fromRGBO(0, 71, 110, 1);

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text("Select Hero"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
              onPressed: () async {
                refresh();
              },
              icon: const Icon(Icons.replay_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search Container
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                "Pilih Hero",
                style: StaticData.titleTextStyle,
              ),
              myContainer(
                  child: Row(
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        onFilter();
                      },
                      icon: const Icon(Icons.search))
                ],
              )),
            ]),

            myContainer(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            selectedType = "Assassin";
                            onFilter();
                          });
                        },
                        child: SizedBox(
                          width: cardsWidth / 4,
                          child: Text(
                            "Assassin",
                            style: selectedType == "Assassin"
                                ? StaticData.selectTypeHeroActive
                                : StaticData.selectTypeHero,
                            textAlign: TextAlign.center,
                          ),
                        )),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "Fighter";
                          onFilter();
                        });
                      },
                      child: Container(
                        width: cardsWidth / 4,
                        child: Text(
                          "Fighter",
                          style: selectedType == "Fighter"
                              ? StaticData.selectTypeHeroActive
                              : StaticData.selectTypeHero,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "Mage";
                          onFilter();
                        });
                      },
                      child: SizedBox(
                        width: cardsWidth / 4,
                        child: Text(
                          "Mage",
                          style: selectedType == "Mage"
                              ? StaticData.selectTypeHeroActive
                              : StaticData.selectTypeHero,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "Marksman";
                          onFilter();
                        });
                      },
                      child: SizedBox(
                        width: cardsWidth / 4,
                        child: Text(
                          "Marksman",
                          style: selectedType == "Marksman"
                              ? StaticData.selectTypeHeroActive
                              : StaticData.selectTypeHero,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "Support";
                          onFilter();
                        });
                      },
                      child: SizedBox(
                        width: cardsWidth / 4,
                        child: Text(
                          "Support",
                          style: selectedType == "Support"
                              ? StaticData.selectTypeHeroActive
                              : StaticData.selectTypeHero,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "Tank";
                          onFilter();
                        });
                      },
                      child: SizedBox(
                        width: cardsWidth / 4,
                        child: Text(
                          "Tank",
                          style: selectedType == "Tank"
                              ? StaticData.selectTypeHeroActive
                              : StaticData.selectTypeHero,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

            // List of Champions
            Container(
              color: cardsColor,
              margin: cardsMargin,
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height - 300,
              child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    for (var champ in champions) buildChampionList(champ),
                  ]),
            ),
          ],
        ));
  }

  Container myContainer({required Widget child}) {
    final double width = MediaQuery.of(context).size.width;
    const double sideCardsMargin = 10;
    final double cardsWidth = width - sideCardsMargin * 2;
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

  Widget buildChampionList(Champion champ) => Container(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChampionPage(
                            champion: champ,
                          )));
            },
            child: champ.icon),
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
