import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:teste_pokedex/api/pokedex_api.dart';
import '../models/pokemon.dart';
import '../utils/pokemon_color.dart';
part 'pokeapi_controller.g.dart';


class PokeApiController = _PokeApiControllerBase with _$PokeApiController;

abstract class _PokeApiControllerBase with Store {

  @observable
  List<Pokemon>? _pokemon; // - > Está observando

  @observable
  Pokemon? _pokemonCurrent;

  @observable
  dynamic pokemonColor;

  @observable
  late int currentPosition;

  @computed
  Pokemon? get pokemonCurrent => _pokemonCurrent;

  @computed
  List<Pokemon>? get pokemon => _pokemon; //Para acessar a variável pokeAPI

  @action
  setPokemonCurrent({required int index}){
    _pokemonCurrent = _pokemon?[index];
    pokemonColor = PokemonColor.getColorType(type: _pokemonCurrent!.type![0]);
  }


  @action
  fetchPokemonList() {
    _getUser().then((pokeList) { // -> Quando completar o loadPokeAPI, vai pegar o valor na variável pokeList
      _pokemon = pokeList!;  // A instancia de PokeApi recebe o valor guardado em pokeList
    });
  }

  @action
  getPokemon({required int index}){
    return _pokemon![index];
  }

  @action
  Widget getImage({required String num}) {
    return Container(
      color: Colors.transparent,
      child: Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png'),
    );
  }

  Future<List<Pokemon>?> _getUser() async {
    try {
      List<Pokemon> pokemonList = [];
      final response = await http.get(PokedexUrl.url); // Espera a resposta da api
      if (response.statusCode == 200){
        var decodeJson = jsonDecode(response.body);
        decodeJson['pokemon'].forEach((item) => pokemonList.add(Pokemon.fromJson(item)));
        return pokemonList;
      } else {
        print('erro ao carregar Lista!');
        return null;
      }
    } catch (error, stacktrace) {
      print('Erro ao carregar!!!!!  ${stacktrace.toString()}');
      return null;
    }
  }
}