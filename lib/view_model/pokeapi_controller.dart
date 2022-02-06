import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_pokedex/models/pokemonColor.dart';
import 'package:mobx/mobx.dart';
import '../models/poke_api.dart';
import '../models/services/consts_api.dart';
part 'pokeapi_controller.g.dart';


class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {

  @observable
  PokeApi? _pokeAPI; // - > Está observando

  @observable
  Pokemon? _pokemonCurrent;

  @observable
  dynamic pokemonColor;

  @observable
  late int currentPosition;

  @computed
  Pokemon? get pokemonCurrent => _pokemonCurrent;

  @computed
  PokeApi? get pokeAPI => _pokeAPI; //Para acessar a variável pokeAPI

  @action
  setPokemonCurrent({required int index}){
    _pokemonCurrent = _pokeAPI?.pokemon![index];
    pokemonColor = PokemonColor.getColorType(type: _pokemonCurrent!.type![0]);
  }


  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokeList) { // -> Quando completar o loadPokeAPI, vai pegar o valor na variável pokeList
      _pokeAPI = pokeList!;  // A instancia de PokeApi recebe o valor guardado em pokeList
    });
  }

  @action
  getPokemon({required int index}){
    return _pokeAPI?.pokemon![index];
  }

  @action
  Widget getImage({required String num}) {
    return Container(
        color: Colors.transparent,
      child: Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png'),
      );
  }

  Future<PokeApi?> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsApi.pokeApiUrl); // Espera a resposta da api
      var decodeJson = jsonDecode(response.body); //jsonDecode - > Pega os valores e transforma em MAP
      return PokeApi.fromJson(decodeJson); //Pega os valores/map e transforma na classe
    } catch (error, stacktrace) {
      print('Erro!  ${stacktrace.toString()}');
      return null;
    }
  }
}