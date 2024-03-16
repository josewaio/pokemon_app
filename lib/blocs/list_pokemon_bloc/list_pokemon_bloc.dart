import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:pokemood/models/pokemon.dart';
import 'package:pokemood/models/region.dart';
import 'package:pokemood/repositories/pokemon_repository.dart';

part 'list_pokemon_event.dart';
part 'list_pokemon_state.dart';

class ListPokemonBloc extends Bloc<ListPokemonEvent, ListPokemonState> {
  ListPokemonBloc() : super(ListPokemonInitial()) {
    on<ListPokemonLoad>((event, emit) async {
      try{
        emit(ListPokemonLoading());
        final pokemons =
            await GetIt.instance.get<PokemonRepository>().fetchPokemons(event.region.quantity);
        emit(ListPokemonLoaded(pokemons));
      }catch(e) {
        emit(ListPokemonError());
      }
    });
  }
}


