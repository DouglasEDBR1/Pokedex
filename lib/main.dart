import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_pokedex/views/screens/home_page.dart';
import 'controller/pokeapi_controller.dart';
import 'controller/pokeapiv2_controller.dart';


void main(){

  _registerStores();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

void _registerStores(){
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(PokeApiController());
  getIt.registerSingleton(PokeApiV2Store());
}
