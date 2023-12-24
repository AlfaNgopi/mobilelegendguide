import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/emblem_set.dart';

Widget EmblemShow(double cardWidth, EmblemSet emblemsSet) {
  return Container(
    color: const Color.fromRGBO(0, 119, 182, 100),
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(emblemsSet.iconDirectory),
          radius: 40,
        ),
        Container(
          width: cardWidth - 120,
          decoration: BoxDecoration(
            color: Color.fromARGB(156, 0, 66, 102),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(emblemsSet.talent1.iconDirectory),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(emblemsSet.talent2.iconDirectory),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(emblemsSet.talent3.iconDirectory),
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
