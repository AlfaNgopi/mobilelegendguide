// ignore_for_file: avoid_print


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/news/event.dart';
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

  
  static Future<List<EventNews>> fetchEvent() {
    try {
      Future<List<EventNews>> newss = FirebaseFirestore.instance
          .collection('news')
          .doc('Event')
          .collection("Events")
          .get()
          .then((value) =>
              value.docs.map((e)  =>  EventNews.fromJson(e.data())).toList());

      print("News Client : success fetchAll");
      return newss;
    } catch (e) {
      print("News Client : $e");
      return Future.error(e);
    }
  }

  
}
