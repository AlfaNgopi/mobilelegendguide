// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/stats.dart';

class StatClient {
  static Future<List<Stats>> fetchAll() {
    try {
      Future<List<Stats>> champions = FirebaseFirestore.instance
          .collection('statss')
          .get()
          .then((value) =>
              value.docs.map((e) => Stats.fromJson(e.data())).toList());

      print("Stat Client : success");
      return champions;
    } catch (e) {
      print("Stat Client : $e");
      return Future.error(e);
    }
  }
}
