// ignore_for_file: avoid_print


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilelegendguide/entity/news/news.dart';

class NewsClient {
  

  
  static Future<List<News>> fetchNews() {
    try {
      Future<List<News>> newss = FirebaseFirestore.instance
          .collection('news')
          .get()
          .then((value) =>
              value.docs.map((e)  =>  News.fromJson(e.data())).toList());

      print("News Client : success fetchAll");
      return newss;
    } catch (e) {
      print("News Client : $e");
      return Future.error(e);
    }
  }

  
}
