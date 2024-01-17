// ignore_for_file: file_names

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobilelegendguide/entity/news/news.dart';

class PatchNote extends News {
  List<dynamic> updates;

  PatchNote({
    required String title,
    required String thumnailDirectory,
    required String releaseDate,
    required String notes,
    required this.updates,
  }) : super(
          title: title,
          thumnailDirectory: thumnailDirectory,
          releaseDate: releaseDate,
          notes: notes,
          storage: FirebaseStorage.instance
              .ref()
              .child('images')
              .child("PatchNotes")
              .child(title),
        );

  @override
  Map<String, dynamic> toJson() => {
        'name': title,
        'thumnailDirectory': thumnailDirectory,
        'releaseDate': releaseDate,
        'updates': updates,
        'notes': notes,
      };

  static PatchNote fromJson(Map<String, dynamic> json) => PatchNote(
        title: json['title'],
        thumnailDirectory: json['banner'],
        releaseDate: json['releaseDate'],
        updates: json['updates'],
        notes: json['notes'],
      );
}
