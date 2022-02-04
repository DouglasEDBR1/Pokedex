// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<Pokemon?>? _$pokemonCurrentComputed;

  @override
  Pokemon? get pokemonCurrent => (_$pokemonCurrentComputed ??=
          Computed<Pokemon?>(() => super.pokemonCurrent,
              name: '_PokeApiStoreBase.pokemonCurrent'))
      .value;
  Computed<PokeApi?>? _$pokeAPIComputed;

  @override
  PokeApi? get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeApi?>(() => super.pokeAPI,
              name: '_PokeApiStoreBase.pokeAPI'))
          .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeApi? get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeApi? value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$_pokemonCurrentAtom = Atom(name: '_PokeApiStoreBase._pokemonCurrent');

  @override
  Pokemon? get _pokemonCurrent {
    _$_pokemonCurrentAtom.reportRead();
    return super._pokemonCurrent;
  }

  @override
  set _pokemonCurrent(Pokemon? value) {
    _$_pokemonCurrentAtom.reportWrite(value, super._pokemonCurrent, () {
      super._pokemonCurrent = value;
    });
  }

  final _$pokemonColorAtom = Atom(name: '_PokeApiStoreBase.pokemonColor');

  @override
  dynamic get pokemonColor {
    _$pokemonColorAtom.reportRead();
    return super.pokemonColor;
  }

  @override
  set pokemonColor(dynamic value) {
    _$pokemonColorAtom.reportWrite(value, super.pokemonColor, () {
      super.pokemonColor = value;
    });
  }

  final _$currentPositionAtom = Atom(name: '_PokeApiStoreBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic setPokemonCurrent({required int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setPokemonCurrent');
    try {
      return super.setPokemonCurrent(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({required int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({required String num}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(num: num);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonColor: ${pokemonColor},
currentPosition: ${currentPosition},
pokemonCurrent: ${pokemonCurrent},
pokeAPI: ${pokeAPI}
    ''';
  }
}
