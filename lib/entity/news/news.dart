
class News {
  String title;
  String thumnailDirectory;
  String releaseDate;
  String notes;

  News({
    required this.title,
    required this.thumnailDirectory,
    required this.releaseDate,
    required this.notes,
  });

  Map<String, dynamic> toJson() => 
     {
      'name': title,
      'thumnailDirectory': thumnailDirectory,
      'releaseDate': releaseDate,
      'notes': notes,
    };
  

  static News fromJson(Map<String, dynamic> json) => News(
        title: json['title'],
        thumnailDirectory: json['banner'],
        releaseDate: json['releaseDate'],
        notes: json['notes'],
      );
}
