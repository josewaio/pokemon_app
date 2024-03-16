part of 'list_pokemon_bloc.dart';

@immutable
abstract class ListPokemonEvent {}



class ListPokemonLoad extends ListPokemonEvent {
  Region region;

  ListPokemonLoad(this.region);
}
