import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../api/pokedex_species.dart';
import '../api/pokedex_v2_api.dart';
import '../models/pokemon_v2.dart';
import '../models/pokemon_species.dart';
part 'pokeapiv2_controller.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {

  @observable
  Specie? specie;

  @observable
  PokeApiV2? pokeApiV2;


  //#### POKEMON V2

  @action
  Future<void> getInfoPokemon(String name) async {
    try {
      final response = await http.get(PokemonV2Url.url(name.toString()));
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return;
    }

  }


  //####### POKEMON SPECIES

  @action
  Future<void> getInfoSpecie(dynamic name) async {
    try {
      specie;
      final response = await http.get(PokemonSpeciesUrl.url(name));
      var decodeJson = jsonDecode(response.body);
      specie = Specie.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return;
    }
  }

}