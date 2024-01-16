import 'package:pokemonsearchapp/features/pokemon_search/data/models/pokemon_model.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pagination.dart';

class PaginationModel extends PaginationEntity {
  const PaginationModel(
      {super.count, super.next, super.previous, super.results});

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<PokemonModel>.from(
                json["results"]!.asMap().entries.map((entry) {
                int idx = entry.key;
                var val = entry.value;

                return PokemonModel.fromJson(val, idx);
              })),
      );
}
