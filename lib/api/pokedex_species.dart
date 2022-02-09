class PokemonSpeciesUrl {

  static Uri url(var name){
    var pokemonSpecieUrl = Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$name");
    return pokemonSpecieUrl;

  }

}