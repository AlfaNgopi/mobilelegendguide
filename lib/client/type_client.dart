// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/type.dart';

class TypeClient {
  static Future<List<Type>> fetchAll() {
    try {
      Future<List<Type>> types = FirebaseFirestore.instance
          .collection('type')
          .get()
          .then((value) =>
              value.docs.map((e) => Type.fromJson(e.data())).toList());

      print("Type Client : success fetchAll");
      return types;
    } catch (e) {
      print("Stat Client : $e");
      return Future.error(e);
    }
  }

  static Future<Type> fetchType(String name) {
    try {
      Future<Type> type = FirebaseFirestore.instance
          .collection('type')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => Type.fromJson(value.docs.first.data()));

      print("emblem Client : success $name");
      return type;
    } catch (e) {
      print("emblem Client : $e");
      return Future.error(e);
    }
  }
}
