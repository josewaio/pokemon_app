part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final Pokemon pokemon;
  final int currentIndex;

  PokemonLoaded(this.pokemon, this.currentIndex);
}

class PokemonError extends PokemonState {}

class PokemonLoading extends PokemonState {}
