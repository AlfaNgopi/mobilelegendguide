class Stats {
  int hp;
  int mana;
  int hpRegen;
  int manaRegen;
  int physicalAtk;
  int magicAtk;
  int physicalDef;
  int magicDef;
  double atkSpeed;
  int movementSpeed;

  Stats({
    required this.hp,
    required this.mana,
    required this.hpRegen,
    required this.manaRegen,
    required this.physicalAtk,
    required this.magicAtk,
    required this.physicalDef,
    required this.magicDef,
    required this.atkSpeed,
    required this.movementSpeed,
  });

  Map<String, dynamic> toJson() => {
        'hp': hp,
        'mana': mana,
        'hpRegen': hpRegen,
        'manaRegen': manaRegen,
        'physicalAtk': physicalAtk,
        'magicAtk': magicAtk,
        'physicalDef': physicalDef,
        'magicDef': magicDef,
        'atkSpeed': atkSpeed,
        'movementSpeed': movementSpeed,
      };

  static Stats fromJson(Map<String, dynamic> json) => Stats(
        hp: json['hp'],
        mana: json['mana'],
        hpRegen: json['hpRegen'],
        manaRegen: json['manaRegen'],
        physicalAtk: json['physicalAtk'],
        magicAtk: json['magicAtk'],
        physicalDef: json['physicalDef'],
        magicDef: json['magicDef'],
        atkSpeed: json['atkSpeed'].toDouble(),
        movementSpeed: json['movementSpeed'],
      );
}
