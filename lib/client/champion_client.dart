// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/champion.dart';

class ChampionClient {
  static Future<List<Champion>> fetchAll() {
    try {
      Future<List<Champion>> champions = FirebaseFirestore.instance
          .collection('champion')
          .get()
          .then((value) =>
              value.docs.map((e) => Champion.fromJson(e.data())).toList());

      print("Champion Client : success");
      return champions;
    } catch (e) {
      print("Champion Client : $e");
      return Future.error(e);
    }
  }

  static createChampion(Champion champion) async {
    try {
      final docChampion =
          FirebaseFirestore.instance.collection('champion').doc();
      final json = champion.toJson();

      await docChampion.set(json);
      print("Champion Client : createChampion success");
    } catch (e) {
      print("Champion Client : createChampion $e");
    }
  }

  static updateDataWinrate() async {
    try {
      final file = await rootBundle.loadString('asset/sample.txt');

      List<String> lines = file.split('\n');

      for (var line in lines) {
        final json = jsonDecode(line);
        final docChampion = FirebaseFirestore.instance
            .collection('datawinrate')
            .doc(json['name'].toString());

        await docChampion.set(json);
      }

      print("Champion Client : updateDatawinrate success");
    } catch (e) {
      print("Champion Client : updateDatawinrate gagal $e");
    }
  }
}
