// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiController on _PokeApiControllerBase, Store {
  Computed<Pokemon?>? _$pokemonCurrentComputed;

  @override
  Pokemon? get pokemonCurrent => (_$pokemonCurrentComputed ??=
          Computed<Pokemon?>(() => super.pokemonCurrent,
              name: '_PokeApiControllerBase.pokemonCurrent'))
      .value;
  Computed<List<Pokemon>?>? _$pokemonComputed;

  @override
  List<Pokemon>? get pokemon =>
      (_$pokemonComputed ??= Computed<List<Pokemon>?>(() => super.pokemon,
              name: '_PokeApiControllerBase.pokemon'))
          .value;

  final _$_pokemonAtom = Atom(name: '_PokeApiControllerBase._pokemon');

  @override
  List<Pokemon>? get _pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  set _pokemon(List<Pokemon>? value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  final _$_pokemonCurrentAtom =
      Atom(name: '_PokeApiControllerBase._pokemonCurrent');

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

  final _$pokemonColorAtom = Atom(name: '_PokeApiControllerBase.pokemonColor');

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

  final _$currentPositionAtom =
      Atom(name: '_PokeApiControllerBase.currentPosition');

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

  final _$_PokeApiControllerBaseActionController =
      ActionController(name: '_PokeApiControllerBase');

  @override
  dynamic setPokemonCurrent({required int index}) {
    final _$actionInfo = _$_PokeApiControllerBaseActionController.startAction(
        name: '_PokeApiControllerBase.setPokemonCurrent');
    try {
      return super.setPokemonCurrent(index: index);
    } finally {
      _$_PokeApiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiControllerBaseActionController.startAction(
        name: '_PokeApiControllerBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({required int index}) {
    final _$actionInfo = _$_PokeApiControllerBaseActionController.startAction(
        name: '_PokeApiControllerBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({required String num}) {
    final _$actionInfo = _$_PokeApiControllerBaseActionController.startAction(
        name: '_PokeApiControllerBase.getImage');
    try {
      return super.getImage(num: num);
    } finally {
      _$_PokeApiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonColor: ${pokemonColor},
currentPosition: ${currentPosition},
pokemonCurrent: ${pokemonCurrent},
pokemon: ${pokemon}
    ''';
  }
}
