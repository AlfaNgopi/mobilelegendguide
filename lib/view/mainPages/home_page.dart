import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobilelegendguide/static_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Mobile Legend Guide",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(children: [
        SizedBox(
          child: CarouselSlider(
            items: StaticData.carrouselImages
                .map(
                  (item) => Center(child: item),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: StaticData.cardsMargin,
            color: Colors.blue,
            child: Padding(
              padding: StaticData.cardsPadding,
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                  children: [
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/champions");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child:
                                    Image.asset("asset/other/champIcon.png")),
                            Text(
                              "Heroes",
                              style: StaticData.menuTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/items");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.asset("asset/other/itemIcon.png")),
                            Text("Items", style: StaticData.menuTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/emblems");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child:
                                    Image.asset("asset/other/emblemIcon.png")),
                            Text("Emblems", style: StaticData.menuTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/lanes");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.asset("asset/other/laneIcon.png")),
                            Text("Lanes", style: StaticData.menuTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/types");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.asset("asset/other/typeIcon.png")),
                            Text("Types", style: StaticData.menuTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/strategy");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.asset(
                                    "asset/other/strategyIcon.png")),
                            Text("Strategy", style: StaticData.menuTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
