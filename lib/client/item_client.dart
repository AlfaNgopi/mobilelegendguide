// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mobilelegendguide/entity/item.dart';

class ItemClient {
  static createItem(Item item) async {
    try {
      final docChampion = FirebaseFirestore.instance.collection('item').doc();
      final json = item.toJson();

      await docChampion.set(json);
      print("Item Client : createItem success");
    } catch (e) {
      print("Item Client : createItem $e");
    }
  }

  static Future<List<Item>> fetchAll() {
    try {
      Future<List<Item>> lanes = FirebaseFirestore.instance
          .collection('item')
          .get()
          .then((value) =>
              value.docs.map((e) => Item.fromJson(e.data())).toList());

      print("Item Client : success fetchAll");
      return lanes;
    } catch (e) {
      print("Item Client : $e");
      return Future.error(e);
    }
  }

  static Future<Item> fetchItem(String name) {
    try {
      Future<Item> type = FirebaseFirestore.instance
          .collection('item')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => Item.fromJson(value.docs.first.data()));

      print("Item Client : success $name");
      return type;
    } catch (e) {
      print("Item Client : $e");
      return Future.error(e);
    }
  }

  static createItemFromJson() async {
    try {
      final file = await rootBundle.loadString('asset/items.json');

      Map<String, dynamic> jsonfile = jsonDecode(file);

      for (var line in jsonfile.values) {
        final docChampion = FirebaseFirestore.instance
            .collection('item')
            .doc(line['name'].toString());

        await docChampion.set(line);
      }

      print("Item Client : createItem success");
    } catch (e) {
      print("Item Client : createItem $e");
    }
  }
}
