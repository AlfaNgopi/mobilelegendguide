// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/lane.dart';

class LaneClient {
  static Future<List<Lane>> fetchAll() {
    try {
      Future<List<Lane>> lanes = FirebaseFirestore.instance
          .collection('lane')
          .get()
          .then((value) =>
              value.docs.map((e) => Lane.fromJson(e.data())).toList());

      print("Lane Client : success fetchAll");
      return lanes;
    } catch (e) {
      print("Lane Client : $e");
      return Future.error(e);
    }
  }

  static Future<Lane> fetchLane(String name) {
    try {
      Future<Lane> type = FirebaseFirestore.instance
          .collection('lane')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => Lane.fromJson(value.docs.first.data()));

      print("lane Client : success $name");
      return type;
    } catch (e) {
      print("lane Client : $e");
      return Future.error(e);
    }
  }
}
