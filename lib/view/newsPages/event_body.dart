// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/news/event.dart';

Widget buildEventBody(EventNews news) {
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
