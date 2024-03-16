import 'package:flutter/material.dart';
import 'package:pokemood/api/constants.dart';
import 'package:pokemood/extensions/context/build_context_extension.dart';
import 'package:pokemood/models/pokemon.dart';

class PokemonName extends StatelessWidget {
  final Pokemon pokemon;
  final double itemHeight = 0.1;

  BuildContext? _context;

  PokemonName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: context.getHeight(itemHeight),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: _pokeCard()),
          Align(
              alignment: Alignment.bottomRight,
              child: _pokeImage()),
        ],
      ),
    );
  }

  Color getRandomColorFromString(String inputString) {
    int hashCode = inputString.hashCode;

    int red = (hashCode >> 16) & 0xFF;
    int green = (hashCode >> 8) & 0xFF;
    int blue = hashCode & 0xFF;

    return Color.fromARGB(255, red, green, blue);
  }

  Widget _pokeImage() {
    return Container(
      child: Image.network(
          ApiConstants.pokemonMiniature + pokemon.id.toString() + '.png'),
    );
  }

  Widget _pokeCard() {
    return Container(
      height: _context!.getHeight(itemHeight/1.7),

        decoration: BoxDecoration(
          color: getRandomColorFromString(pokemon.name!),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                pokemon.name!.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
