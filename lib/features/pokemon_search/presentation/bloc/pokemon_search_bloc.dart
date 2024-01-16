import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pokemon_details.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_event.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_state.dart';

class PokemonSearchBloc extends Bloc<PokemonSearchEvent, PokemonSearchState> {
  final GetPaginationUsecase _getPaginationUsecase;
  final GetPokemonDetailsUsecase _getPokemonDetailsUsecase;
  final String paginationOffset = "0"; //offset start at 0
  final String paginationLimit = "500"; //limit pokemons per 1 fetch
  late List<PokemonEntity>? pokemons;
  PokemonSearchBloc(this._getPaginationUsecase, this._getPokemonDetailsUsecase)
      : super(const PokemonSearchLoading()) {
    on<GetPagination>(_onGetPagination);
    on<OnChangeSearchBar>(_onChangeSearchBar);
    on<OnGetPokemonDetail>(_onGetPokemonDetails);
  }

  FutureOr<void> _onGetPagination(
      GetPagination event, Emitter<PokemonSearchState> emit) async {
    final params =
        GetPaginationParams(offset: paginationOffset, limit: paginationLimit);
    final dataState = await _getPaginationUsecase(params: params);
    await Future.delayed(const Duration(seconds: 1));
    if (dataState is DataSuccess) {
      pokemons = dataState.data!.results;
      var initCurrentPokemons = 10;
      var currentPokemons = randomPokemons(initCurrentPokemons);
      emit(PokemonSearchDone(null, dataState.data, currentPokemons,
          PokemonSearchStep.searchStep, null));
    }

    if (dataState is DataFailed) {
      emit(PokemonSearchError(dataState.error));
    }
  }

  List<PokemonEntity> randomPokemons(int pokemonsCount) {
    final shuffledPokemons = List<PokemonEntity>.from(pokemons!)..shuffle();

    return shuffledPokemons.take(pokemonsCount).toList();
  }

  FutureOr<void> _onChangeSearchBar(
      OnChangeSearchBar event, Emitter<PokemonSearchState> emit) {
    final state = this.state;
    if (state is PokemonSearchDone) {
      if (event.keyword.isEmpty) {
        return null;
      } else {
        var matchedPokemons = <PokemonEntity>[];
        var maxMatchedPokemon = 20;
        matchedPokemons = pokemons!
            .where((pokemon) => pokemon.name
                .toLowerCase()
                .contains(event.keyword.toLowerCase()))
            .toList();
        if (matchedPokemons.length > maxMatchedPokemon) {
          matchedPokemons.removeRange(
              maxMatchedPokemon, matchedPokemons.length);
        }
        emit(PokemonSearchDone(null, state.pagination, matchedPokemons,
            state.pokemonSearchStep, null));
      }
    }
  }

  FutureOr<void> _onGetPokemonDetails(
      OnGetPokemonDetail event, Emitter<PokemonSearchState> emit) async {
    final state = this.state;
    final actualIndex = event.pokemonIndex + 1;
    emit(PokemonSearchDone(
        actualIndex,
        state.pagination,
        state.currentSearchedPokemons,
        PokemonSearchStep.waitingForDetails,
        state.currentPokemonDetails));

    if (state is PokemonSearchDone) {
      final dataState = await _getPokemonDetailsUsecase(
          params: actualIndex); //must +1 because of api

      if (dataState is DataSuccess) {
        var currentPokemonDetails = dataState.data;
        emit(PokemonSearchDone(
            actualIndex,
            state.pagination,
            state.currentSearchedPokemons,
            PokemonSearchStep.detailsStep,
            currentPokemonDetails));
        //then switch back to searchStep immediately
        await Future.delayed(const Duration(milliseconds: 100));
        emit(PokemonSearchDone(
            actualIndex,
            state.pagination,
            state.currentSearchedPokemons,
            PokemonSearchStep.searchStep,
            state.currentPokemonDetails));
      }

      if (dataState is DataFailed) {
        emit(PokemonSearchError(dataState.error));
      }
    }
  }
}
