// ignore_for_file: file_names

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobilelegendguide/entity/news/news.dart';

class EventNews extends News {
  List<dynamic> content;

  EventNews({
    required String title,
    required String thumnailDirectory,
    required String releaseDate,
    required String notes,
    required this.content,
  }) : super(
          title: title,
          thumnailDirectory: thumnailDirectory,
          releaseDate: releaseDate,
          notes: notes,
          storage: FirebaseStorage.instance
              .ref()
              .child('images')
              .child("Event")
              .child(title),
        );

  @override
  Map<String, dynamic> toJson() => {
        'name': title,
        'thumnailDirectory': thumnailDirectory,
        'releaseDate': releaseDate,
        'content': content,
        'notes': notes,
      };

  static EventNews fromJson(Map<String, dynamic> json) {
    return EventNews(
      title: json['title'],
      thumnailDirectory: json['banner'],
      releaseDate: json['releaseDate'],
      content: json['content'],
      notes: json['notes'],
    );
  }

  Future<void> changeUrl() async {
    Future<String> getDowloadUrl(String url, String title) async {
      final dashImageref = storage.child(url);
      url = await dashImageref.getDownloadURL();
      return url;
    }

    var oldContent = content;
    List<dynamic> newContent = [];
    for (Map<String, dynamic> tent in oldContent) {
      if (tent["type"] == "image") {
        String tempUrl = tent["content"];
        tent["content"] = await getDowloadUrl(tempUrl, title);
      } else if (tent["type"] == "images") {
        List<dynamic> tempUrls = tent["content"];
        List<String> urls = [];
        for (String tempUrl in tempUrls) {
          urls.add(await getDowloadUrl(tempUrl, title));
        }
        tent["content"] = urls;
      }

      newContent.add(tent);
    }

    content = newContent;
  }
}
