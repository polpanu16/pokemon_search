// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';

abstract class PokemonSearchState extends Equatable {
  final PaginationEntity? pagination;
  final DioException? error;
  final List<PokemonEntity>? currentSearchedPokemons;
  final PokemonSearchStep? pokemonSearchStep;
  final PokemonDetailsEntity? currentPokemonDetails;

  const PokemonSearchState(
      {this.pagination,
      this.error,
      this.currentSearchedPokemons,
      this.pokemonSearchStep,
      this.currentPokemonDetails});

  @override
  List<Object?> get props => [
        pagination,
        error,
        currentSearchedPokemons,
        pokemonSearchStep,
        currentPokemonDetails
      ];
}

class PokemonSearchLoading extends PokemonSearchState {
  const PokemonSearchLoading();
}

class PokemonSearchDone extends PokemonSearchState {
  final int? currentPokemonDetailsIndex;
  const PokemonSearchDone(
      this.currentPokemonDetailsIndex,
      PaginationEntity? pagination,
      List<PokemonEntity>? currentSearchedPokemons,
      PokemonSearchStep? pokemonSearchStep,
      PokemonDetailsEntity? currentPokemonDetails)
      : super(
            pagination: pagination,
            currentSearchedPokemons: currentSearchedPokemons,
            pokemonSearchStep: pokemonSearchStep,
            currentPokemonDetails: currentPokemonDetails);

  @override
  List<Object?> get props => [
        currentPokemonDetailsIndex,
        pagination,
        error,
        currentSearchedPokemons,
        pokemonSearchStep,
        currentPokemonDetails
      ];
}

class PokemonSearchError extends PokemonSearchState {
  const PokemonSearchError(DioException? error) : super(error: error);
}

enum PokemonSearchStep { searchStep, waitingForDetails, detailsStep }
