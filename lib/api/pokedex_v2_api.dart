class PokemonV2Url {

  static Uri url(var name){
     var pokemonV2Url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$name");
     return pokemonV2Url;

  }

}