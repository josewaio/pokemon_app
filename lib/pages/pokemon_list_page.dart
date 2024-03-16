import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemood/blocs/list_pokemon_bloc/list_pokemon_bloc.dart';
import 'package:pokemood/components/cards/pokemon_name.dart';
import 'package:pokemood/models/pokemon.dart';
import 'package:pokemood/models/region.dart';
import 'package:pokemood/pages/pokemon_page.dart';

class PokemonListPage extends StatelessWidget {
  static Route route({required region}) => MaterialPageRoute<void>(
      builder: (_) => PokemonListPage(
            region: region,
          ));
  Region region;

  PokemonListPage({Key? key, required this.region}) : super(key: key);
  List<Pokemon> pokemons = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ListPokemonBloc()..add(ListPokemonLoad(region)),
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              Navigator.pop(context);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: BlocConsumer<ListPokemonBloc, ListPokemonState>(
                  listener: (context, state) {
                if (state is ListPokemonError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Image not loaded')),
                  );
                } else if (state is ListPokemonLoaded) {
                  pokemons = state.pokemons;
                }
              }, builder: (context, state) {
                if (state is ListPokemonLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 25,),
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PokemonPage.route(
                                pokemon: pokemons[index].id!, region: region)),
                        child: PokemonName(pokemon: pokemons[index]),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  );
                } else if (state is ListPokemonLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
          ),
        ));
  }
}
