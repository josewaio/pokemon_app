import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemood/api/constants.dart';

import 'package:pokemood/models/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> fetchPokemons(int quantity) async {
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.allPokemonsGame +
        quantity.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> resultsJson = jsonDecode(response.body)['results'];
      final List<Pokemon> pokemons = resultsJson.map((e) {
        List<String> explodedUrl = e["url"].split('/');
        String id = explodedUrl.elementAt(explodedUrl.length - 2);
        return Pokemon(id: int.parse(id), name: e["name"], url: e["url"]);
      }).toList();
      return pokemons;
    } else {
      throw Exception('Error al cargar las imágenes');
    }
  }

  Future<Pokemon> getbyID(int id) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.pokemonDescription + id.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar las imágenes');
    }
  }
}
