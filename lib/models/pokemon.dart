class Pokemon {
  int? id;
  String? name;
  String? url;
  int? weight;
  String? type;
  int? attack;
  int? defense;
  int? speed;
  String? hability;
  int? baseExperience;
  int? gameIndex;


  Pokemon(
      {this.id,
      this.name,
      this.url,
      this.weight,
      this.type,
      this.attack,
      this.defense,
      this.speed,
      this.hability,
      this.baseExperience,
      this.gameIndex});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json["name"],
      url: json["url"],
      weight: json["weight"] ?? 0,
      type: json["types"][0]['type']["name"] ?? '',
      attack: json["stats"][1]['base_stat'] ?? 0,
      defense: json["stats"][2]['base_stat'] ?? 0,
      speed:json["stats"][5]['base_stat'] ?? 0,
      hability: json['abilities'][0]['ability']['name'] ?? '',
      baseExperience: json['base_experience'] ?? 0,
      gameIndex: json['game_indices'][0]['game_index'] ?? 0,
    );
  }
//
}
