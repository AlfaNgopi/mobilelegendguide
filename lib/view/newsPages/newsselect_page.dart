import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/itemPages/item_page.dart';
import 'package:mobilelegendguide/view/newsPages/news_page.dart';

class NewsSelectPage extends StatefulWidget {
  const NewsSelectPage({super.key});

  @override
  State<NewsSelectPage> createState() => _NewsSelectPageState();
}

class _NewsSelectPageState extends State<NewsSelectPage> {
  List<News> newss = [];
  final storage = FirebaseStorage.instance.ref().child('images');

  String url = "";

  bool isLoading = true;

  void refresh() async {
    // var championsFromDatabase = await ChampionClient.fetchAll();

    var newsFromStaticData = await StaticData.getNews();

    for (News news in newsFromStaticData) {
      final dashImageref = storage.child(news.thumnailDirectory);
      url = await dashImageref.getDownloadURL();
      news.thumnailDirectory = url;
    }

    setState(() {
      newss = newsFromStaticData;

      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    // const double sideCardsMargin = 10;
    // final double cardsWidth = width - sideCardsMargin * 2;

    // const EdgeInsetsGeometry cardsMargin =
    //     EdgeInsets.symmetric(vertical: 10, horizontal: 10);

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: const Text("Select News"),
      ),
      body: ListView(
        children: List.generate(newss.length, (index) {
          News news = newss[index];
          return InkWell(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: const BoxConstraints.expand(height: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Card(
                        child: SizedBox(
                            child: Image.network(news.thumnailDirectory)),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(news.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Flexible(
                                child: Text(
                              news.notes,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            )),
                            Text(news.releaseDate,
                                style: const TextStyle(color: Colors.grey)),
                            const Text("Read More >>>",
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      )
                    ],
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsPage(news: news)));
              });
        }),
      ),
    );
  }
}
