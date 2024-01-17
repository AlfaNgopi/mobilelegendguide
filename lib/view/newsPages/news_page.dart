import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/news/event.dart';
import 'package:mobilelegendguide/entity/news/patchNote.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/view/newsPages/event_body.dart';
import 'package:mobilelegendguide/view/newsPages/patchnote_body.dart';

class NewsPage extends StatelessWidget {
  final Color cardsColor = Colors.blue;
  final News news;

  const NewsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    //this variable

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.network(news.thumnailDirectory),
          ),
          Center(
            child: Text(
              news.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.releaseDate,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.notes,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (news is PatchNote)
            buildPatchNoteBody(news as PatchNote)
          else if (news is EventNews)
            buildEventBody(news as EventNews)
          else
            Container(),
        ],
      ),
    );
  }
}
