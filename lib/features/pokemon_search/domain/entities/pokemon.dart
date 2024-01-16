// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String name;
  final String url;
  final int id;

  const PokemonEntity({required this.name, required this.url, required this.id});

  @override
  List<Object?> get props => [name, url, id];
}
