import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemood/api/constants.dart';
import 'package:pokemood/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:pokemood/components/cards/pokemon_card.dart';
import 'package:pokemood/extensions/context/build_context_extension.dart';
import 'package:pokemood/models/pokemon.dart';
import 'package:pokemood/models/region.dart';

class PokemonPage extends StatelessWidget {
  static Route route({required pokemon, required region}) =>
      MaterialPageRoute<void>(
          builder: (_) =>
              PokemonPage(
                pokemonID: pokemon,
                region: region,
              ));

  final int pokemonID;
  final Region region;

  const PokemonPage({Key? key, required this.pokemonID, required this.region})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
        PokemonBloc()
          ..add(LoadPokemonEvent(pokemonID)),
        child: BlocPokemonView(pokemonID: pokemonID, region: region));
  }
}

class BlocPokemonView extends StatelessWidget {
  Pokemon? pokemon;
  int pokemonID;
  Region region;

  BlocPokemonView({
    required this.pokemonID,
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<PokemonBloc, PokemonState>(
                  listener: (context, state) {
                    if (state is PokemonLoaded) {
                      pokemon = state.pokemon;
                    } else if (state is PokemonError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Image not loaded')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is PokemonError) {
                      return const Center(
                        child: Text('Image not loaded'),
                      );
                    }
                    List<Widget> widgets = [];

                    if (state is PokemonLoading) {
                      widgets.add(Padding(
                        padding: EdgeInsets.only(top: context.getHeight(0.3)),
                        child: const Center(child: CircularProgressIndicator()),
                      ));
                    } else if (state is PokemonLoaded) {
                      widgets.addAll([
                        PokemonCard(pokemon: pokemon!, url: _image()),
                        const SizedBox(
                          height: 20,
                        ),
                      ]);
                    }
                    return Column(
                      children: widgets,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      onPressed: () {
                        pokemonID =
                            _restartPokemonCycle(pokemonID -= 1, region.quantity);
                        context
                            .read<PokemonBloc>()
                            .add(LoadPokemonEvent(pokemonID));
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      onPressed: () {
                        pokemonID =
                            _restartPokemonCycle(pokemonID += 1, region.quantity);
                        context
                            .read<PokemonBloc>()
                            .add(LoadPokemonEvent(pokemonID));
                      },
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _image() {
    var id = _restartPokemonCycle(pokemonID, region.quantity);
    return ('${ApiConstants.pokemonImages}${id.toString().padLeft(
        3, '0')}.png');
  }
}

int _restartPokemonCycle(int pokemonID, int quantity) {
  if (pokemonID > quantity) {
    pokemonID = 1;
  } else if (pokemonID <= 0) {
    pokemonID = quantity;
  }
  return pokemonID;
}
