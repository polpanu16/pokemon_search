import 'package:flutter/material.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_event.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/page/pokemon_details_page.dart';
import 'package:pokemonsearchapp/injection_container.dart';
import 'package:page_transition/page_transition.dart';
import '../bloc/pokemon_search_state.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_searchbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Pokemon Search",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocProvider<PokemonSearchBloc>(
          create: (context) => sl()..add(GetPagination()),
          child: _buildBody(context),
        ),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenheigh = MediaQuery.of(context).size.height;
  var paddingSize = screenWidth * 0.02;

  return BlocConsumer<PokemonSearchBloc, PokemonSearchState>(
    listener: (context, state) {
      if (state is PokemonSearchDone &&
          state.pokemonSearchStep == PokemonSearchStep.waitingForDetails) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }

      if (state is PokemonSearchDone &&
          state.pokemonSearchStep == PokemonSearchStep.detailsStep) {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: PokemonDetailsPage(
                currentPokemonDetails: state.currentPokemonDetails!,
                pokemonIndex: state.currentPokemonDetailsIndex!,
              ),
            ));
      }
    },
    builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: paddingSize),
        child: Column(
          children: [
            const PokemonSearchBar(),
            if (state is PokemonSearchDone) ...[
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: paddingSize,
                    mainAxisSpacing: paddingSize,
                  ),
                  itemCount: state.currentSearchedPokemons!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PokemonCard(
                      pokemonIndex: state.currentSearchedPokemons![index].id,
                      pokemonName: state.currentSearchedPokemons![index].name,
                    );
                  },
                ),
              ),
              SizedBox(height: paddingSize)
            ] else if (state is PokemonSearchLoading) ...[
              SizedBox(
                  height: screenheigh * 0.6,
                  child: const Center(child: CircularProgressIndicator())),
            ] else ...[
              const Center(child: Text("Couldn't load pokemons")),
            ],
          ],
        ),
      );
    },
  );
}
