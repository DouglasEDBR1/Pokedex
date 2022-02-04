import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../models/pokeapiv2.dart';
import '../models/species.dart';
part 'pokeapiv2_controller.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {

  @observable
  Specie? specie;

  @observable
  PokeApiV2? pokeApiV2;

  @action
  Future<void> getInfoPokemon(String name) async {
    try {
      final pokeapiv2URL = Uri.parse(
          'https://pokeapi.co/api/v2/pokemon/${name.toString()}');
      final response = await http.get(pokeapiv2URL);
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return;
    }
  }

  @action
  Future<void> getInfoSpecie(dynamic name) async {
    try {
      specie;
      final pokeapiv2EspeciesURL = Uri.parse(
          'https://pokeapi.co/api/v2/pokemon-species/${name.toString()}');
      final response = await http.get(pokeapiv2EspeciesURL);
      var decodeJson = jsonDecode(response.body);
      specie = Specie.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return;
    }
  }

}