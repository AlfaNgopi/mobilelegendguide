// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/emblem.dart';

class EmblemClient {
  static Future<List<Emblem>> fetchAll() {
    try {
      Future<List<Emblem>> emblems = FirebaseFirestore.instance
          .collection('emblem')
          .get()
          .then((value) =>
              value.docs.map((e) => Emblem.fromJson(e.data())).toList());

      print("emblem Client : success");
      return emblems;
    } catch (e) {
      print("emblem Client : $e");
      return Future.error(e);
    }
  }

  static Future<Emblem> fetchEmblem(String name) {
    try {
      Future<Emblem> emblem = FirebaseFirestore.instance
          .collection('emblem')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => Emblem.fromJson(value.docs.first.data()));

      print("emblem Client : success $name");
      return emblem;
    } catch (e) {
      print("emblem Client : $e");
      return Future.error(e);
    }
  }
}
