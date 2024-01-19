import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/newsPages/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> news = StaticData.news;

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
      body: ListView(children: [
        SizedBox(
          child: CarouselSlider(
            items: StaticData.news
                .map((item) => Center(
                        child: FittedBox(
                      child: TextButton(
                          child: Image.network(item.thumnailDirectory),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsPage(news: item),
                              ))),
                    )))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Card(
          margin: StaticData.cardsMargin,
          color: Colors.blue,
          child: Padding(
            padding: StaticData.cardsPadding,
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
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
                              child: Image.asset("asset/other/champIcon.png")),
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
                              child: Image.asset("asset/other/emblemIcon.png")),
                          Text("Emblems", style: StaticData.menuTextStyle),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/tierlist");
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                              height: 100,
                              child:
                                  Icon(Icons.format_list_numbered, size: 100)),
                          Text("Tier List", style: StaticData.menuTextStyle),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/winrate");
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                              height: 100,
                              child: Icon(Icons.calculate, size: 100)),
                          FittedBox(
                            child: Text("Calculate Winrate",
                                style: StaticData.menuTextStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/analytics");
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              height: 100,
                              child:
                                  Image.asset("asset/other/strategyIcon.png")),
                          Text("Strategy", style: StaticData.menuTextStyle),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/news");
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                              height: 100,
                              child: Icon(Icons.newspaper, size: 100)),
                          FittedBox(
                            child: Text("News & Updates",
                                style: StaticData.menuTextStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
