// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class PokemonSearchEvent extends Equatable {
  const PokemonSearchEvent();

  @override
  List<Object> get props => [];
}

class GetPagination extends PokemonSearchEvent {}

class OnChangeSearchBar extends PokemonSearchEvent {
  final String keyword;
  const OnChangeSearchBar({
    required this.keyword,
  });

  @override
  List<Object> get props => [keyword];
}

class OnGetPokemonDetail extends PokemonSearchEvent {
  final int pokemonIndex;

  const OnGetPokemonDetail({required this.pokemonIndex});

  @override
  List<Object> get props => [pokemonIndex];
}
