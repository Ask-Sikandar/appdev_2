class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int? candyCount;
  final String egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  final List<Evolution>? nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      num: json['num'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      type: (json['type'] as List).map((e) => e as String).toList(),
      height: json['height'] as String,
      weight: json['weight'] as String,
      candy: json['candy'] as String,
      candyCount: json['candy_count'],
      egg: json['egg'] as String,
      spawnChance: json['spawn_chance'].toDouble() as double,
      avgSpawns: json['avg_spawns'].toDouble(),
      spawnTime: json['spawn_time'] as String,
      multipliers: (json['multipliers'] as List?)?.map((e) => e as double).toList(),
      weaknesses: (json['weaknesses'] as List?)?.map((e) => e as String).toList(),
      nextEvolution: (json['next_evolution'] as List?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Evolution {
  final String num;
  final String name;

  Evolution({
    required this.num,
    required this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      num: json['num'] as String,
      name: json['name'] as String,
    );
  }
}
