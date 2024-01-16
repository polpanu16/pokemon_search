import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/data_sources/pokemon_details_api_service.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl extends PokemonDetailsRepository {
  final PokemonDetailsApiService _pokemonDetailsApiService;

  PokemonDetailsRepositoryImpl(this._pokemonDetailsApiService);

  @override
  Future<DataState<PokemonDetailsEntity>> getPokemonDetails(
      int? pokemonIndex) async {
    try {
      final httpResponse = await _pokemonDetailsApiService.getPokemonDetails(
          pokemonIndex: pokemonIndex.toString());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data, error: null);
      } else {
        return DataFailed(
            data: null,
            error: DioException(
                requestOptions: httpResponse.response.requestOptions,
                message: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
