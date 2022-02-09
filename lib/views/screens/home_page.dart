import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_pokedex/utils/pokemon_color.dart';
import '../../controller/pokeapi_controller.dart';
import '../../utils/consts_app.dart';
import 'detail_pokemon.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dynamic _pokemonController = GetIt.I<PokeApiController>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    if (_pokemonController.pokemon == null) {
      _pokemonController.fetchPokemonList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -(240 / 3.4),
            left: size.width - (240 / 1.6),
            child: Opacity(opacity: 0.1,
                child: Image.asset(ConstsApp.darkPokeball,
                  height: 240,
                  width: 240,
                )),
          ),
          ContainerPlus(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbarBuild(),
                const SizedBox(height: 24,),
                Expanded(
                  child: ContainerPlus(
                    width: double.infinity,
                    child: Observer(
                      builder: (BuildContext context) {
                        return (_pokemonController.pokemon != null)
                            ? AnimationLimiter(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(12),
                            physics: const BouncingScrollPhysics(),
                            addAutomaticKeepAlives: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                            itemCount: _pokemonController.pokemon?.length,
                            itemBuilder: (context, index) {

                              var pokemon = _pokemonController.pokemon?[index];

                              return AnimationConfiguration.staggeredGrid(
                                  columnCount: 2,
                                  position: index,
                                  duration:
                                  const Duration(milliseconds: 375),
                                  child:
                                  ContainerPlus(
                                    padding: const EdgeInsets.all(2),
                                    child: ScaleAnimation(
                                      child: InkWell(
                                        child: cardPokemon(PokemonColor.getColorType(type: pokemon.type![0]), pokemon.name, typesPokemon(pokemon.type), 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemon.num}.png'),
                                        onTap: () {
                                          _pokemonController.setPokemonCurrent(index: index);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext
                                                context) =>
                                                    AnimationConfiguration.staggeredGrid(
                                                        position: index,
                                                        columnCount: 2,
                                                        child: PokeDetailPage(index: index, pokemonNum: pokemon.num, pokemonName: pokemon.name, pokemonColor: PokemonColor.getColorType(type: pokemon.type![0]), pokemonType: pokemon.type,)),
                                                fullscreenDialog: true,
                                              ));
                                        },
                                      ),
                                    ),
                                  )
                              );
                            },
                          ),
                        )
                            : const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  //  ####################    METHODS   #####################


  // ############# CARD POKEMON ################

  Widget cardPokemon(color, String pokemonName, Widget pokemonType, String pokemonImage){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerPlus(
        color: color,
        radius: RadiusPlus.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      pokemonName,
                      style: const TextStyle(
                          fontFamily: 'Google',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: pokemonType,
                  ),
                ],
              ),
              Align(                                  // -> Imagem Background
                alignment: Alignment.bottomRight,
                child: Opacity(
                  child: Image.asset(
                    ConstsApp.whitePokeball,
                    height: 100,
                    width: 100,
                  ),
                  opacity: 0.2,
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.network(
                    pokemonImage,
                    height: 100,
                    width: 100,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }


  // ############# TYPE POKEMON ########################

  Widget typesPokemon(List<String> types) {
    List<Widget> lista = [];
    for (var nome in types) {
      lista.add(
        Column(
          children: <Widget>[
            ContainerPlus(
              padding: const EdgeInsets.all(0),
              radius: RadiusPlus.all(20),
              color: const Color.fromARGB(80, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome,
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      );
    }
    return ContainerPlus(
      //border: BorderPlus(color: Colors.black),
      child: Column(
        children: lista,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }


  // ###########  AppBar  #############

  Widget appbarBuild(){

    var size = MediaQuery.of(context).size;

    return ContainerPlus(
      // color: Colors.blue,
      padding: EdgeInsets.only(top: size.height * .05, left: size.width * .04, right: size.width * .04,) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          InkWell(
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          InkWell(
            child: Icon(
              Icons.menu,
            ),
          )
        ],
      ),
    );
  }

}
