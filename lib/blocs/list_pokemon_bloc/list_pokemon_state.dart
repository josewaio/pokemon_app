part of 'list_pokemon_bloc.dart';

@immutable
abstract class ListPokemonState {}

class ListPokemonInitial extends ListPokemonState {}

class ListPokemonLoading extends ListPokemonState {}

class ListPokemonLoaded extends ListPokemonState {
  List<Pokemon> pokemons;

  ListPokemonLoaded(this.pokemons);
}

class ListPokemonError extends ListPokemonState {}
