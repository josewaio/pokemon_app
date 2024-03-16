import 'package:get_it/get_it.dart';
import 'package:pokemood/repositories/pokemon_repository.dart';
import 'package:pokemood/repositories/region_repository.dart';

class GetItConfig {
  static void setUp() {
    final GetIt getIt = GetIt.instance;
    getIt.registerSingleton<PokemonRepository>(PokemonRepository());
    getIt.registerSingleton<RegionRepository>(RegionRepository());

  }
}
