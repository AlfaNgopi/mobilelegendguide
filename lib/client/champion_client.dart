// ignore_for_file: avoid_print

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
}
