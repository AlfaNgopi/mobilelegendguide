// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mobilelegendguide/entity/emblem.dart';

class EmblemClient {
  static createEmblem(Emblem emblem) async {
    try {
      final docChampion = FirebaseFirestore.instance.collection('emblem').doc();
      final json = emblem.toJson();

      await docChampion.set(json);
      print("emblem Client : createemblem success");
    } catch (e) {
      print("emblem Client : createemblem $e");
    }
  }

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

  static createEmblemFromJson() async {
    try {
      final file = await rootBundle.loadString('asset/emblems.json');

      Map<String, dynamic> jsonfile = jsonDecode(file);

      for (var line in jsonfile.values) {
        final docChampion = FirebaseFirestore.instance
            .collection('emblem')
            .doc(line['name'].toString());

        await docChampion.set(line);
      }

      print("emblem Client : createemblem success");
    } catch (e) {
      print("emblem Client : $e");
    }
  }
}
