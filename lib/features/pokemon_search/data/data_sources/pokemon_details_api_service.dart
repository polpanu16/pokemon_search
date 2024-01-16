import 'package:dio/dio.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/models/pagination_model.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/models/pokemon_details_model.dart';
import 'package:retrofit/retrofit.dart';
part 'pokemon_details_api_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokemonDetailsApiService {
  factory PokemonDetailsApiService(Dio dio) = _PokemonDetailsApiService;

  @GET('/pokemon/{pokemonIndex}')
  Future<HttpResponse<PokemonDetailsModel>> getPokemonDetails({
    @Path("pokemonIndex") required String pokemonIndex,
  });
}
