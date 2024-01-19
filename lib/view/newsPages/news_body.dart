// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/static_data.dart';

Widget buildNewsBody(News news) {
  return Column(
      children: List.generate(news.content.length, (index) {
    Map<String, dynamic> tent = news.content[index];
    return tent["type"] == "texts"
        ? buildTexts(tent["content"])
        : tent["type"] == "image"
            ? buildImage(tent["content"])
            : tent["type"] == "images"
                ? buildImages(tent["content"])
                : tent["type"] == "text"
                    ? buildText(tent["content"])
                    : tent["type"] == "update"
                    ? buildUpdates(tent["content"])
                    : Container();
  }));
}

Widget buildTexts(List<dynamic> tent) {
  return Container(
    constraints: BoxConstraints.tightFor(width: double.infinity),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            List.generate(tent.length, (index) => buildText(tent[index]))),
  );
}

Widget buildText(dynamic value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      value,
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget buildImages(List<String> tent) {
  return Container(
    constraints: BoxConstraints.tightFor(width: double.infinity),
    child: Wrap(
        children: List.generate(
            tent.length,
            (index) => Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: buildImage(
                  tent[index],
                )))),
  );
}

Widget buildImage(String url) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Image.network(url),
  );
}

Widget buildUpdates(Map<String,dynamic> update) {
  List<Champion> champions = StaticData.champions;
  return Card(
      color: StaticData.cardColor,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                backgroundImage: AssetImage(champions
                    .firstWhere((element) => element.name == update['name'])
                    .profileDirectory),
              ),
              Text(
                update["name"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(update["changes"].length, (index) {
                Map<String, dynamic> updateDetail = update["changes"][index];
                return Container(
                  constraints: BoxConstraints.tightFor(width: double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.white,
                      ),
                      Text(
                        updateDetail["skillName"],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                            updateDetail["skillDesc"].length, (index) {
                          return SizedBox(
                            width: double.infinity,
                            child: Text(
                              updateDetail["skillDesc"][index],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
}
