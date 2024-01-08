import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/itemPages/item_page.dart';

class ItemSelectPage extends StatefulWidget {
  const ItemSelectPage({super.key});

  @override
  State<ItemSelectPage> createState() => _ItemSelectPageState();
}

class _ItemSelectPageState extends State<ItemSelectPage> {
  List<Item> items = [];
  late int itemCount = 0;
  bool isLoading = true;
  final Color cardsColor = Colors.blue;

  String selectedType = "All";

  void refresh() async {
    // var championsFromDatabase = await ChampionClient.fetchAll();

    var itemsFromStaticData = StaticData.items;

    setState(() {
      items = itemsFromStaticData;
      itemCount = items.length;
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
          title: const Text("Select Item"),
        ),
        body: ListView(
          children: [
            // Search Container
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                "Pilih Item",
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
              padding: StaticData.cardsPadding,
              child: buildTypeSelector([
                "Attack",
                "Magic",
                "Defense",
                "Movement",
                "Jungling",
                "Roaming",
                "Other"
              ], cardsWidth),
            ),

            // List of items

            Container(
              color: cardsColor,
              margin: StaticData.cardsMargin,
              padding: StaticData.cardsPadding,
              child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for (var item in items) buildItemList(item),
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
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return buildItemList(items[index]);
      });

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

  Widget buildItemList(Item item) => InkWell(
        child: FittedBox(child: item.icon),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemPage(
                        item: item,
                      )));
        },
      );

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

    // ignore: avoid_print
    print("mencari $query dengan tipe $selectedType");

    List<Item> champsAsType;
    if (selectedType != "All") {
      champsAsType =
          StaticData.items.where((item) => item.type == selectedType).toList();
    } else {
      champsAsType = StaticData.items;
    }

    List<Item> hasilCari = champsAsType;
    if (query.isNotEmpty) {
      hasilCari = [];
      for (var champ in champsAsType) {
        if (champ.name.toLowerCase().contains(query.toLowerCase())) {
          hasilCari.add(champ);
        }
      }
    }

    setState(() {
      items = hasilCari;
      itemCount = items.length;
    });
  }
}
