class Champion {
  String? id;
  String name;
  String type;
  String lane;
  String speciality;
  // Map<String, dynamic> stats;

  Champion({
    this.id,
    required this.name,
    required this.type,
    required this.lane,
    required this.speciality,
    // required this.stats,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'lane': lane,
        'speciality': speciality,
        // 'stats': stats,
      };

  static Champion fromJson(Map<String, dynamic> json) => Champion(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        lane: json['lane'],
        speciality: json['speciality'],
        // stats: json['stats'],
      );
}
