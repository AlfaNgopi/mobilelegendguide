import 'package:firebase_storage/firebase_storage.dart';

class News {
  String title;
  String thumnailDirectory;
  String releaseDate;
  String notes;

  Reference storage;

  News({
    required this.title,
    required this.thumnailDirectory,
    required this.releaseDate,
    required this.notes,
    required this.storage,
  });

  Map<String, dynamic> toJson() => {
        'name': title,
        'thumnailDirectory': thumnailDirectory,
        'releaseDate': releaseDate,
        'notes': notes,
      };

  

  Future<void> changeThumnailUrl() async {
    final dashImageref = storage.child(thumnailDirectory);
    thumnailDirectory = await dashImageref.getDownloadURL();

    
  }
}
