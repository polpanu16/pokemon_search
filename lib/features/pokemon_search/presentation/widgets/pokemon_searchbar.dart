import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_event.dart';

class PokemonSearchBar extends StatelessWidget {
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<PokemonSearchBloc>(context)
              .add(OnChangeSearchBar(keyword: value));
        },
        decoration: const InputDecoration(
            labelText: "pokemon search", suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}
