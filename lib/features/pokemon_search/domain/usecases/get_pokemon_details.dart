import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/core/usecases/usecase.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pokemon_details_repository.dart';

class GetPokemonDetailsUsecase
    extends UseCase<DataState<PokemonDetailsEntity>, int> {
  final PokemonDetailsRepository _pokemonDetailsRepository;

  GetPokemonDetailsUsecase(this._pokemonDetailsRepository);

  @override
  Future<DataState<PokemonDetailsEntity>> call({int? params}) {
    return _pokemonDetailsRepository.getPokemonDetails(params);
  }
}
