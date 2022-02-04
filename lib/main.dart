import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_pokedex/screens/home.dart';
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
  getIt.registerSingleton(PokeApiStore());
  getIt.registerSingleton(PokeApiV2Store());
}







// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomePage(),
//       ), providers: <SingleChildWidget>[
//       Provider<PokeApiStore>(
//         create: (_) => PokeApiStore(),
//       ),
//     ],
//     );
//   }
// }
