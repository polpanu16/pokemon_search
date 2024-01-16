import 'package:flutter/material.dart';
import 'package:pokemonsearchapp/core/util/custom_widget.dart';
import 'package:pokemonsearchapp/core/util/utils.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pokemon_details.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage(
      {super.key,
      required this.currentPokemonDetails,
      required this.pokemonIndex});
  final int pokemonIndex;
  final PokemonDetailsEntity currentPokemonDetails;

  @override
  Widget build(BuildContext context) {
    var mainColors = Utils.getMainColorByType(currentPokemonDetails.types[0]);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColors,
          title: const Text(
            "Pokemon Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: _buildBody(context, mainColors));
  }

  _buildBody(BuildContext context, var mainColors) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenheigh = MediaQuery.of(context).size.height;
    var paddingSize = screenWidth * 0.02;
    var containerHeigh = screenheigh * 0.2;
    var imageRad = containerHeigh / 2;

    return Container(
      child: Column(children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: containerHeigh,
                ),
                Container(
                  height: containerHeigh,
                  color: mainColors,
                ),
              ],
            ),
            Positioned(
                bottom: containerHeigh - imageRad,
                child: CircleAvatar(
                  backgroundColor: mainColors,
                  radius: imageRad,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: imageRad - 2,
                    child: CustomWidget.cachedCircleAvatar(
                        radius: imageRad - 2,
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonIndex.png"),
                  ),
                )),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  height: containerHeigh - imageRad,
                  child: Padding(
                    padding: EdgeInsets.all(paddingSize / 2),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Column(
                        children: [
                          Text(
                            currentPokemonDetails.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "Height : ${currentPokemonDetails.height}\nWeight : ${currentPokemonDetails.weight}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: paddingSize),
              CustomWidget.pokemonsTypeImage(currentPokemonDetails.types),
              SizedBox(height: paddingSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statusWidget(currentPokemonDetails.stats[0], mainColors,
                      screenWidth * 0.2),
                  _statusWidget(currentPokemonDetails.stats[1], mainColors,
                      screenWidth * 0.2),
                  _statusWidget(currentPokemonDetails.stats[2], mainColors,
                      screenWidth * 0.2)
                ],
              ),
              SizedBox(height: paddingSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statusWidget(currentPokemonDetails.stats[3], mainColors,
                      screenWidth * 0.2,
                      isUpside: false),
                  _statusWidget(currentPokemonDetails.stats[4], mainColors,
                      screenWidth * 0.2,
                      isUpside: false),
                  _statusWidget(currentPokemonDetails.stats[5], mainColors,
                      screenWidth * 0.2,
                      isUpside: false)
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ]),
    );
  }

  Widget _statusWidget(StatsEntity stats, Color mainColors, double size,
      {bool isUpside = true}) {
    return Container(
        height: size,
        width: size,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: mainColors,
                  borderRadius: (isUpside)
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))
                      : null),
              height: size / 2,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(stats.stat,
                        style: const TextStyle(color: Colors.white))),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                  color: mainColors.withOpacity(0.5),
                  borderRadius: (!isUpside)
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))
                      : null),
              height: size / 2,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      stats.baseStat.toStringAsFixed(0),
                      style: const TextStyle(color: Colors.white),
                    )),
              )),
            ),
          ],
        ));
  }
}
