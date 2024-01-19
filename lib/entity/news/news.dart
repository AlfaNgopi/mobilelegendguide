import 'package:firebase_storage/firebase_storage.dart';

class News {
  String title;
  String thumnailDirectory;
  String releaseDate;
  String notes;
  List<dynamic> content;

  late Reference storage;

  News(
      {required this.title,
      required this.thumnailDirectory,
      required this.releaseDate,
      required this.notes,
      required this.content}) {
    storage = FirebaseStorage.instance
        .ref()
        .child('images')
        .child("news")
        .child(title);
  }

  Map<String, dynamic> toJson() {
   
    return {
      'name': title,
      'thumnailDirectory': thumnailDirectory,
      'releaseDate': releaseDate,
      'content': content, // 'content': content.toJson(),
      'notes': notes,
    };
  }

  Future<void> changeThumnailUrl() async {
    final dashImageref = storage.child(thumnailDirectory);
    thumnailDirectory = await dashImageref.getDownloadURL();
  }

  static News fromJson(Map<String, dynamic> json) {
    return News(
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
