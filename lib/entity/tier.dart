class Tier {
  String tier;
  double winrate;
  double pickrate;
  double banrate;

  Tier({
    required this.tier,
    required this.winrate,
    required this.pickrate,
    required this.banrate,
  });

  Map<String, dynamic> toJson() => {
        'tier': tier,
        'winrate': winrate,
        'pickrate': pickrate,
        'banrate': banrate,
      };

  static Tier fromJson(Map<String, dynamic> json) => Tier(
        tier: json['tier'],
        winrate: json['winrate'],
        pickrate: json['pickrate'],
        banrate: json['banrate'],
      );
}
