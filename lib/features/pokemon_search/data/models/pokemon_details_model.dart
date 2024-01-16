import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';

class PokemonDetailsModel extends PokemonDetailsEntity {
  const PokemonDetailsModel(
      {required super.name,
      required super.types,
      required super.stats,
      required super.weight,
      required super.height});

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        height: json["height"],
        name: json["name"],
        stats: json["stats"] == null
            ? []
            : List<StatsModel>.from(
                json["stats"]!.map((x) => StatsModel.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"].map((x) => x["type"]["name"])),
        weight: json["weight"],
      );
}

class StatsModel extends StatsEntity {
  const StatsModel({required super.baseStat, required super.stat});

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        baseStat: json["base_stat"],
        stat: json["stat"] == null ? null : json["stat"]["name"],
      );
}
