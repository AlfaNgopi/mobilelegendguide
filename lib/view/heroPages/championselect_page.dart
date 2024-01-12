import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/heroPages/champion_page.dart';

class ChampionSelectPage extends StatefulWidget {
  const ChampionSelectPage({super.key});

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

    return Scaffold(
        backgroundColor: StaticData.backgroundColor,
        appBar: AppBar(
          title: const Text("Select Hero"),
        ),
        body: ListView(
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

            Container(
              color: cardsColor,
              margin: cardsMargin,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: buildTypeSelector(
                  StaticData.types.map((e) => e.name).toList(), cardsWidth),
            ),

            // List of Champions
            Container(
              color: cardsColor,
              margin: cardsMargin,
              padding: const EdgeInsets.all(10),
              // height: MediaQuery.of(context).size.height - 300,
              child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    for (var champ in champions) buildChampionList(champ),
                  ]),
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

  Widget buildChampionList(Champion champ) => InkWell(
      child: FittedBox(child: CircleAvatar(backgroundImage: AssetImage(champ.profileDirectory))),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChampionPage(
                      champion: champ,
                    )));
      },
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
