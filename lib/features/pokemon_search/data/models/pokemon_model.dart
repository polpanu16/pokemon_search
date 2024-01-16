import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel(
      {required super.name, required super.url, required super.id});

  factory PokemonModel.fromJson(Map<String, dynamic> json, int index) =>
      PokemonModel(name: json["name"], url: json["url"], id: index);
}
