// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PokemonDetailsEntity extends Equatable {
  final String name;
  final List<String> types;
  final List<StatsEntity> stats;
  final num weight;
  final num height;

  const PokemonDetailsEntity(
      {required this.name,
      required this.types,
      required this.stats,
      required this.weight,
      required this.height});

  @override
  List<Object> get props {
    return [
      name,
      types,
      stats,
      weight,
      height,
    ];
  }
}

class StatsEntity extends Equatable {
  final int baseStat;
  final String stat;

  const StatsEntity({
    required this.baseStat,
    required this.stat,
  });

  @override
  List<Object?> get props => [baseStat, stat];
}
