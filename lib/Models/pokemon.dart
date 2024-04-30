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
  final double? spawnChance;
  final double? avgSpawns;
  final String? spawnTime;
  final List<double>? multipliers;
  final List<String> weaknesses;
  final List<Map<String, dynamic>>? prevEvolution;
  final List<Map<String, dynamic>>? nextEvolution;

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
    required this.prevEvolution,
    required this.nextEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candyCount'],
      egg: json['egg'],
      spawnChance: json['spawn_chance'].toDouble(),
      avgSpawns: json['avg_spawns'].toDouble(),
      spawnTime: json['spawn_time'],
      weaknesses: List<String>.from(json['weaknesses']),
      multipliers: json['multipliers'] == null
          ? null
          : List<double>.from(json['multipliers']),
      prevEvolution: json['prev_evolution'] == null
          ? null
          : List<Map<String, dynamic>>.from(json['prev_evolution']),
      nextEvolution: json['next_evolution'] == null
          ? null
          : List<Map<String, dynamic>>.from(json['next_evolution']),
    );
  }
}