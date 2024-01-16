import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_event.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {super.key, required this.pokemonIndex, required this.pokemonName});
  final int pokemonIndex;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<PokemonSearchBloc>(context)
            .add(OnGetPokemonDetail(pokemonIndex: pokemonIndex));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.65),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black87.withOpacity(0.5),
              width: double.infinity,
              height: height * 0.05,
              child: Center(
                  child: Text(
                pokemonName,
                style: const TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(
              height: height * 0.15,
              child: CachedNetworkImage(
                  imageUrl:
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemonIndex + 1}.png",
                  placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                  errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
