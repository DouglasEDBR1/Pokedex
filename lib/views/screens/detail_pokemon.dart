import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_pokedex/models/pokemonColor.dart';
import '../../models/getStatusPokemon.dart';
import '../../models/poke_api.dart';
import '../../models/pokeapiv2.dart';
import '../../models/services/consts_app.dart';
import '../../models/species.dart';
import '../../view_model/pokeapi_controller.dart';
import '../../view_model/pokeapiv2_controller.dart';


class PokeDetailPage extends StatefulWidget {
  final int index;
  final dynamic pokemonNum;
  final String pokemonName;
  final dynamic pokemonColor;
  final dynamic pokemonType;


  const PokeDetailPage({Key? key, required this.index, required this.pokemonNum, required this.pokemonName, this.pokemonColor, this.pokemonType}) : super(key: key);

  @override
  State<PokeDetailPage> createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> with TickerProviderStateMixin {

  PokeApiV2Store? _pokeApiV2Store;
  PokeApiStore? _pokemonStore;
  Animation? rotationAnimation;
  PokeApiV2? pokeApiV2;
  PokemonColor? pokemonColor;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pokemonStore = GetIt.I<PokeApiStore>();
    _pokeApiV2Store = GetIt.I<PokeApiV2Store>();
    if (_pokemonStore?.pokeAPI == null) {
      _pokemonStore?.fetchPokemonList();
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbarBuilder(),
        body: ContainerPlus(
          width: double.infinity,
          color: widget.pokemonColor,
          child: Stack(
            children: [
              ContainerPlus(
                width: double.infinity,
                // border: BorderPlus(color: Colors.red),
                padding: const EdgeInsets.only(top: 90),
                child: AnimatedBuilder(
                  animation: _controller,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                      height: 270,
                      width: 270,
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 258),
                      child: ContainerPlus(
                        //border: BorderPlus(color: Colors.blue, width: 6),
                        color: Colors.white,
                        radius: RadiusPlus.only(
                          topLeft: 30,
                          topRight: 30,
                        ),
                        child: Column(
                          children:  [
                            Expanded(
                              child: DefaultTabController(
                                  length: 3,
                                  initialIndex: 0,
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ContainerPlus(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: const TabBar(
                                            labelColor: Colors.black,
                                            unselectedLabelColor: Colors.black26,
                                            indicatorColor: Colors.black,
                                            indicatorWeight: 2.0,
                                            indicatorSize: TabBarIndicatorSize.label,
                                            labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                                            tabs: [
                                              Tab(text: 'About'),
                                              Tab(text: 'Evolution'),
                                              Tab(text: 'Status'),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                        child: ContainerPlus(
                                          height: size.height * 0.5,
                                          child: TabBarView(
                                            children: [
                                              pokemonAboutBuilder(),
                                              pokemonEvolutionGrid(),
                                              pokemonStatusBuilder(),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              pokemonInfo(),

              Positioned(
                  top: 90,
                  left: 110,
                  child: ContainerPlus(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerPlus(
                          height: 200,
                          width: 200,
                          child: Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${widget.pokemonNum}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }



  // #####################     METHODS   #######################


  //################   APPBAR   #################

  AppBar appbarBuilder(){
    return AppBar(
      elevation: 0,
      backgroundColor: widget.pokemonColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }


  // ###############   POKEMON INFO   #############################

  Widget pokemonInfo(){

    return ContainerPlus(
      padding: const EdgeInsets.only(left: 18),
      height: 100,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPlus(
                    widget.pokemonName,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white,
                    // padding: EdgeInsets.only(bottom: 12),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextPlus(
                      '#${widget.pokemonNum}',
                      padding: const EdgeInsets.only(right: 16),
                      color: Colors.white,
                      fontWeight: FontWeight.w500,

                    )
                  ]
              ),
              Row(
                children: [
                  typesPokemon(widget.pokemonType!)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }


  // 1 ############### ABOUT POKEMON ####################

  Widget pokemonAboutBuilder(){

    var size = MediaQuery.of(context).size;

    return ContainerPlus(
      padding: const EdgeInsets.only(top: 30, left: 18),
      child:  Observer(
        builder: (context) {

          _pokeApiV2Store?.getInfoPokemon(widget.pokemonName.toLowerCase());
          _pokeApiV2Store?.getInfoSpecie(widget.pokemonName.toLowerCase());

          var pokemonHeight = _pokemonStore?.pokemonCurrent?.height;
          var pokemonWeight = _pokemonStore?.pokemonCurrent?.weight;

          Specie? _pokemonGenera = _pokeApiV2Store?.specie;
          String? pokemonSpecie = _pokemonGenera?.genera!.where((item) => item.language?.name == 'en').first.genus;

          Specie? _specie = _pokeApiV2Store?.specie;
          String? pokemonAbout = _specie?.flavorTextEntries?.where((item) => item.language?.name == 'en').first.flavorText;
          pokemonAbout = pokemonAbout?.replaceAll('\n', ' ');

          if (_specie != null) {
            return ContainerPlus(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextPlus(
                    'About',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    textAlign: TextAlign.left,
                    padding: const EdgeInsets.only(bottom: 18),
                  ),
                  ContainerPlus(
                    // color: Colors.blue,
                    width: 70,
                    child: TextPlus(
                      pokemonAbout,
                      fontSize: 16,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: size.height * .033,),
                  TextPlus(
                    'Bio',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    padding: const EdgeInsets.only(bottom: 18),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContainerPlus(
                        width: 250,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextPlus(
                                  'Height',
                                  fontSize: 16,
                                  color: Colors.black45,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                                TextPlus(
                                  pokemonHeight,
                                  fontSize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextPlus(
                                  'Weight',
                                  fontSize: 16,
                                  color: Colors.black45,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                                TextPlus(
                                  pokemonWeight,
                                  fontSize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextPlus(
                                  'Specie',
                                  fontSize: 16,
                                  color: Colors.black45,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                                TextPlus(
                                  pokemonSpecie,
                                  fontSize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.left,
                                  padding: const EdgeInsets.only(bottom: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );

  }


  // 2  ############### EVOLUTION GRID ########

  Widget pokemonEvolutionGrid(){

    return ContainerPlus(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextPlus(
            'Evolution grid',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            padding: const EdgeInsets.only(top: 36, bottom: 36),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolutions()
          )
        ],
      ),
    );

  }


  // 3 ########### STATUS POKEMON ##############

  Widget pokemonStatusBuilder(){

    return ContainerPlus(
        padding: const EdgeInsets.only(top: 24, left: 30),
        child:  Observer(
          builder: (BuildContext context) {
            return Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextPlus(
                      'Speed',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'Sp.Def',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'Sp.Att',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'Defense',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'Atack',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'HP',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 16,),
                    TextPlus(
                      'Total',
                      fontSize: 18,
                    ),
                  ],
                ),

                const SizedBox(width: 40,),

                Observer(builder: (BuildContext context) {

                  List<int> _list = StatusPokemon.getStatusPokemon(_pokeApiV2Store!.pokeApiV2!);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextPlus(
                        _list[0].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[1].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[2].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[3].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[4].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[5].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 16,),
                      TextPlus(
                        _list[6].toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  );
                },
                ),
                Expanded(
                  child: Observer(
                    builder: (BuildContext context) {
                      List<int> _list = StatusPokemon.getStatusPokemon(_pokeApiV2Store!.pokeApiV2!);
                      return Column(
                        children: [
                          statusBarBuilder(_list[0] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[1] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[2] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[3] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[4] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[5] / 160, 'red'),
                          const SizedBox(height: 25,),
                          statusBarBuilder(_list[6] / 800, 'green'),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        )
    );
  }


  // ################ STATUS BAR ###############

  Widget statusBarBuilder(dynamic statusBar, String color){

    var size = MediaQuery.of(context).size;

    return  Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (color == 'red')
              ...[Container(
                height: 4,
                width: size.width * .46,
                alignment: Alignment.centerLeft,
                decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Colors.grey
                ),
                child: FractionallySizedBox(
                  widthFactor: statusBar,
                  heightFactor: 1.0,
                  child: Container(
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color:  Colors.red,
                      )
                  ),
                ),
              ),
              ]else ...[
              Container(
                height: 4,
                width: size.width * .46,
                alignment: Alignment.centerLeft,
                decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Colors.grey
                ),
                child: FractionallySizedBox(
                  widthFactor: statusBar,
                  heightFactor: 1.0,
                  child: Container(
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.green,
                      )
                  ),
                ),
              ),
            ]
          ]
      ),
    );
  }


  // ################## POKEMON EVOLUTION #############

  List<Widget> getEvolutions() {
    List<Widget> _list = [];
    Pokemon pokemon = _pokemonStore!.pokemonCurrent!;
    if (pokemon.prevEvolution != null){
      pokemon.prevEvolution?.forEach((element) {
        _list.add(
          ContainerPlus(
            //border: BorderPlus(color: Colors.red),
            child: Column(children: [
              ContainerPlus(
                  width: 80,
                  height: 80,
                  child: _pokemonStore!.getImage(num: element.num!)),
              TextPlus(
                element.name,
                fontSize: 14,
                padding: const EdgeInsets.only(top: 12),
                fontWeight: FontWeight.w500,
              )
            ]),
          ),
        );
        _list.add(const Icon(Icons.keyboard_arrow_right));
      });
    }

    _list.add(
      ContainerPlus(
        //border: BorderPlus(color: Colors.red),
        child: Column(children: [
          ContainerPlus(
              width: 80,
              height: 80,
              child: _pokemonStore!.getImage(num: _pokemonStore!.pokemonCurrent!.num!)),
          TextPlus(
            _pokemonStore!.pokemonCurrent!.name,
            fontSize: 14,
            padding: const EdgeInsets.only(top: 12),
            fontWeight: FontWeight.w500,
          )
        ]),
      ),
    );

    if (pokemon.nextEvolution != null){
      pokemon.nextEvolution?.forEach((element) {
        _list.add(const Icon(Icons.keyboard_arrow_right));
        _list.add(
          ContainerPlus(
            child: Column(children: [
              ContainerPlus(
                  width: 80,
                  height: 80,
                  child: _pokemonStore!.getImage(num: element.num!)),
              TextPlus(
                element.name,
                fontSize: 14,
                padding: const EdgeInsets.only(top: 12),
                fontWeight: FontWeight.w500,
              )
            ]),
          ),
        );
      });
    }
    return _list;
  }


  // ######## Pokemon Type ####################

  Widget typesPokemon(List<String> types) {
    List<Widget> list = [];
    for (var pokemonName in types) {
      list.add(
        Row(
          children: <Widget>[
            ContainerPlus(
              radius: RadiusPlus.all(20),
              color: const Color.fromARGB(80, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                child: Text(
                  pokemonName,
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      );
    }
    return ContainerPlus(
      //border: BorderPlus(color: Colors.black),
      child: Row(
        children: list,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

}


