import 'package:flutter/material.dart';
import 'package:pokemood/constants/colors.dart';
import 'package:pokemood/extensions/context/build_context_extension.dart';
import 'package:pokemood/models/pokemon.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final String url;

  const PokemonCard({required this.pokemon, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.getLightYellow,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              height: context.getHeight(.4),
              fit: BoxFit.cover,
              image: url,
              placeholder: kTransparentImage,
            ),
          ), //Image.network(url),

          const SizedBox(height: 10),
          Text(
            'Name: ${pokemon.name}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            'Type: ${pokemon.type}',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: CustomColors.getPokemonBlue,
            ),
          ),
          const Divider(color: Colors.black),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Attack: ${pokemon.attack}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              Text(
                'Defense: ${pokemon.defense}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
              Text(
                'Speed: ${pokemon.speed}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
