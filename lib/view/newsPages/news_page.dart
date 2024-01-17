import 'package:flutter/material.dart';
import 'package:mobilelegendguide/entity/news/patchNote.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
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
      body: buildPatchNoteBody(news as PatchNote)
          ,
    );
  }
}
