// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/spell.dart';

class SpellClient {
  static Future<List<Spell>> fetchAll() {
    try {
      Future<List<Spell>> spell = FirebaseFirestore.instance
          .collection('battlespell')
          .get()
          .then((value) =>
              value.docs.map((e) => Spell.fromJson(e.data())).toList());

      print("spell Client : success fetchAll");
      return spell;
    } catch (e) {
      print("spell Client : $e");
      return Future.error(e);
    }
  }

  static Future<Spell> fetchSpell(String name) {
    try {
      Future<Spell> spell = FirebaseFirestore.instance
          .collection('battlespell')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => Spell.fromJson(value.docs.first.data()));

      print("spell Client : success $name");
      return spell;
    } catch (e) {
      print("spell Client : $e");
      return Future.error(e);
    }
  }
}
