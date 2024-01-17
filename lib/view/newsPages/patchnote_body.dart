// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/news/patchNote.dart';
import 'package:mobilelegendguide/static_data.dart';

Widget buildPatchNoteBody(PatchNote news) {
  List<Champion> champions = StaticData.champions;

  return Column(
      children: List.generate(news.updates.length, (index) {
    Map<String, dynamic> update = news.updates[index];
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
  }));
}
