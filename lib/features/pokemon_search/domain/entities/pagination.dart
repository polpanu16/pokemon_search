// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon.dart';

class PaginationEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonEntity>? results;

  const PaginationEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}
