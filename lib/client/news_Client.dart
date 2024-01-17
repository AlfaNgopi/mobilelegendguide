// ignore_for_file: avoid_print


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/entity/news/patchNote.dart';

class NewsClient {
  static Future<List<PatchNote>> fetchPatchNotes() {
    try {
      Future<List<PatchNote>> newss = FirebaseFirestore.instance
          .collection('news')
          .doc('PatchNotes')
          .collection("Patches")
          .get()
          .then((value) =>
              value.docs.map((e) => PatchNote.fromJson(e.data())).toList());

      print("News Client : success fetchAll");
      return newss;
    } catch (e) {
      print("News Client : $e");
      return Future.error(e);
    }
  }

  //TODO: change to fetchAll
  static Future<List<PatchNote>> fetchEvent() {
    try {
      Future<List<PatchNote>> newss = FirebaseFirestore.instance
          .collection('news')
          .doc('Event')
          .collection("Patches")
          .get()
          .then((value) =>
              value.docs.map((e) => PatchNote.fromJson(e.data())).toList());

      print("News Client : success fetchAll");
      return newss;
    } catch (e) {
      print("News Client : $e");
      return Future.error(e);
    }
  }

  static Future<News> fetchNews(String name) {
    try {
      Future<News> type = FirebaseFirestore.instance
          .collection('news')
          .where('name', isEqualTo: name)
          .get()
          .then((value) => News.fromJson(value.docs.first.data()));

      print("News Client : success $name");
      return type;
    } catch (e) {
      print("News Client : $e");
      return Future.error(e);
    }
  }
}
