class Tier {
  String tier;
  double poin;
  double winrate;
  double pickrate;
  double banrate;

  Tier({
    required this.tier,
    required this.poin,
    required this.winrate,
    required this.pickrate,
    required this.banrate,
  });

  Map<String, dynamic> toJson() => {
        'tier': tier,
        'poin': poin,
        'winrate': winrate,
        'pickrate': pickrate,
        'banrate': banrate,
      };

  static Tier fromJson(Map<String, dynamic> json) => Tier(
        tier: json['tier'],
        poin: json['poin'].toDouble(),
        winrate: json['winrate'].toDouble(),
        pickrate: json['pickrate'].toDouble(),
        banrate: json['banrate'].toDouble(),
      );
}
