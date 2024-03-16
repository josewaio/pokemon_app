import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemood/models/pokemon.dart';
import 'package:pokemood/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<LoadPokemonEvent>((event, emit) async {
     _fetchPokemon(event.id);
    });

  }

  Future<void> _fetchPokemon(int id) async {
    try {
      emit(PokemonLoading());
      final pokemon =
          await GetIt.instance.get<PokemonRepository>().getbyID(id);
      emit(PokemonLoaded(pokemon, 0));
    } catch (_) {
      emit(PokemonError());
    }
  }
}
