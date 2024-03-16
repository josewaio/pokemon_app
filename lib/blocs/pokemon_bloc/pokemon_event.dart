part of 'pokemon_bloc.dart';


abstract class PokemonEvent {}

class LoadPokemonEvent extends PokemonEvent{
  int id;

  LoadPokemonEvent(this.id);
}

class NextPokemon extends PokemonEvent{}

class BackPokemon extends PokemonEvent{}


