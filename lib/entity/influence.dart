class Influence {
  double earlytomidgame = 0;
  double lategame = 0;
  double teamfight = 0;
  double pickoff = 0;
  double push = 0;

  Influence({
    required this.earlytomidgame,
    required this.lategame,
    required this.teamfight,
    required this.pickoff,
    required this.push,
  });

  List<double> getChampInfluence() {
    return [
      push,
      earlytomidgame,
      pickoff,
      teamfight,
      lategame,
    ];
  }

  Map<String, dynamic> toJson() => {
        'earlytomidgame': earlytomidgame,
        'lategame': lategame,
        'teamfight': teamfight,
        'pickoff': pickoff,
        'push': push,
      };

  static Influence fromJson(Map<String, dynamic> json) => Influence(
        earlytomidgame: json['earlytomidgame'].toDouble(),
        lategame: json['lategame'].toDouble(),
        teamfight: json['teamfight'].toDouble(),
        pickoff: json['pickoff'].toDouble(),
        push: json['push'].toDouble(),
      );
}
