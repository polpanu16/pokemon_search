import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';

abstract class PokemonDetailsRepository {
  Future<DataState<PokemonDetailsEntity>> getPokemonDetails(int? pokemonIndex);
}
