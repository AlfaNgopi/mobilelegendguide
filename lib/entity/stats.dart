class Stats {
  int hp;
  int mana;
  double hpRegen;
  double manaRegen;
  int physicalAtk;
  int magicAtk;
  int physicalDef;
  int magicDef;
  double atkSpeed;
  int movementSpeed;
  double atkSpeedRatio;

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
    required this.atkSpeedRatio,
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
        'atkSpeedRatio': atkSpeedRatio,
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
        atkSpeed: json['atkSpeed'],
        movementSpeed: json['movementSpeed'],
        atkSpeedRatio: json['atkSpeedRatio'],
      );
}
