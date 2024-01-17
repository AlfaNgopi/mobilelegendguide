// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/news/patchNote.dart';
import 'package:mobilelegendguide/static_data.dart';

Widget buildPatchNoteBody(PatchNote news) {
  List<Champion> champions = StaticData.champions;

  

  return ListView(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Image.network(news.thumnailDirectory),
      ),
      Text(
        news.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        news.releaseDate,
        style: TextStyle(color: Colors.grey),
      ),
      Text(
        news.notes,
        style: TextStyle(color: Colors.white),
      ),
      Column(
          children: List.generate(news.updates.length, (index) {
        Map<String, dynamic> update = news.updates[index];
        return Card(
          color: StaticData.cardColor,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage(champions
                  .firstWhere((element) => element.name == update['name'])
                  .profileDirectory),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                    update["name"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: List.generate(update["changes"].length, (index) {
                      Map<String, dynamic> updateDetail =
                          update["changes"][index];
                      return Column(
                        children: [
                          Text(
                            updateDetail["skillName"],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            updateDetail["skillDesc"][0],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          ]),
        );
      }))
    ],
  );
}
