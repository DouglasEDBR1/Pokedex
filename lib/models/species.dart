// class Specie {
//   int? count;
//   String? next;
//   Null? previous;
//   List<Results>? results;
//
//   Specie({this.count, this.next, this.previous, this.results});
//
//   Specie.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     next = json['next'];
//     previous = json['previous'];
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['next'] = this.next;
//     data['previous'] = this.previous;
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Results {
//   String? name;
//   String? url;
//
//   Results({this.name, this.url});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['url'] = this.url;
//     return data;
//   }
// }


class Specie {
  int? baseHappiness;
  int? captureRate;
  ObjPokemon? color;
  EvolutionChain? evolutionChain;
  ObjPokemon? evolvesFromSpecies;
  List<FlavorTextEntries>? flavorTextEntries;
  bool? formsSwitchable;
  int? genderRate;
  List<Genera>? genera;
  ObjPokemon? generation;
  ObjPokemon? growthRate;
  ObjPokemon? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  String? name;
  List<Names>? names;
  int? order;
  List<PalParkEncounters>? palParkEncounters;
  List<PokedexNumbers>? pokedexNumbers;
  ObjPokemon? shape;
  List<Varieties>? varieties;

  Specie(
      {required this.baseHappiness,
        required this.captureRate,
        required this.color,
        required this.evolutionChain,
        required this.evolvesFromSpecies,
        required this.flavorTextEntries,
        required this.formsSwitchable,
        required this.genderRate,
        required this.genera,
        required this.generation,
        required this.growthRate,
        required this.habitat,
        required this.hasGenderDifferences,
        required this.hatchCounter,
        required this.id,
        required this.isBaby,
        required this.name,
        required this.names,
        required this.order,
        required this.palParkEncounters,
        required this.pokedexNumbers,
        required this.shape,
        required this.varieties});

  Specie.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = json['color'] != null ? ObjPokemon.fromJson(json['color']) : null;
    evolutionChain = json['evolution_chain'] != null
        ? EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'] != null ? ObjPokemon.fromJson(json['evolves_from_species']) : null;
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries?.add(FlavorTextEntries.fromJson(v));
      });
    }
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    if (json['genera'] != null) {
      genera = <Genera>[];
      json['genera'].forEach((v) {
        genera?.add(Genera.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? ObjPokemon.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? ObjPokemon.fromJson(json['growth_rate'])
        : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    name = json['name'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names?.add(Names.fromJson(v));
      });
    }
    order = json['order'];
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = <PalParkEncounters>[];
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters?.add(PalParkEncounters.fromJson(v));
      });
    }
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers = <PokedexNumbers>[];
      json['pokedex_numbers'].forEach((v) {
        pokedexNumbers?.add(PokedexNumbers.fromJson(v));
      });
    }
    shape = json['shape'] != null ? ObjPokemon.fromJson(json['shape']) : null;
    if (json['varieties'] != null) {
      varieties = <Varieties>[];
      json['varieties'].forEach((v) {
        varieties?.add(Varieties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_happiness'] = baseHappiness;
    data['capture_rate'] = captureRate;
    if (color != null) {
      data['color'] = color?.toJson();
    }
    if (evolutionChain != null) {
      data['evolution_chain'] = evolutionChain?.toJson();
    }
    data['evolves_from_species'] = evolvesFromSpecies;
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries?.map((v) => v.toJson()).toList();
    }
    data['forms_switchable'] = formsSwitchable;
    data['gender_rate'] = genderRate;
    if (genera != null) {
      data['genera'] = genera?.map((v) => v.toJson()).toList();
    }
    if (generation != null) {
      data['generation'] = generation?.toJson();
    }
    if (growthRate != null) {
      data['growth_rate'] = growthRate?.toJson();
    }
    if (habitat != null) {
      data['habitat'] = habitat?.toJson();
    }
    data['has_gender_differences'] = hasGenderDifferences;
    data['hatch_counter'] = hatchCounter;
    data['id'] = id;
    data['is_baby'] = isBaby;
    data['name'] = name;
    if (names != null) {
      data['names'] = names?.map((v) => v.toJson()).toList();
    }
    data['order'] = order;
    if (palParkEncounters != null) {
      data['pal_park_encounters'] =
          palParkEncounters?.map((v) => v.toJson()).toList();
    }
    if (pokedexNumbers != null) {
      data['pokedex_numbers'] =
          pokedexNumbers?.map((v) => v.toJson()).toList();
    }
    if (shape != null) {
      data['shape'] = shape?.toJson();
    }
    if (varieties != null) {
      data['varieties'] = varieties?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ObjPokemon {
  String? name;
  String? url;

  ObjPokemon({required this.name, required this.url});

  ObjPokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class EvolutionChain {
  String? url;

  EvolutionChain({required this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  ObjPokemon? language;
  ObjPokemon? version;

  FlavorTextEntries({required this.flavorText, required this.language, required this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language =
    json['language'] != null ? ObjPokemon.fromJson(json['language']) : null;
    version =
    json['version'] != null ? ObjPokemon.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    if (language != null) {
      data['language'] = language?.toJson();
    }
    if (version != null) {
      data['version'] = version?.toJson();
    }
    return data;
  }
}

class Genera {
  String? genus;
  ObjPokemon? language;

  Genera({required this.genus, required this.language});

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language =
    json['language'] != null ? ObjPokemon.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genus'] = genus;
    if (language != null) {
      data['language'] = language?.toJson();
    }
    return data;
  }
}

class Names {
  ObjPokemon? language;
  String? name;

  Names({required this.language, required this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language =
    json['language'] != null ? ObjPokemon.fromJson(json['language']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (language != null) {
      data['language'] = language?.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class PalParkEncounters {
  ObjPokemon? area;
  int? baseScore;
  int? rate;

  PalParkEncounters({this.area, this.baseScore, this.rate});

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? ObjPokemon.fromJson(json['area']) : null;
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (area != null) {
      data['area'] = area?.toJson();
    }
    data['base_score'] = baseScore;
    data['rate'] = rate;
    return data;
  }
}

class PokedexNumbers {
  int? entryNumber;
  ObjPokemon? pokedex;

  PokedexNumbers({required this.entryNumber, required this.pokedex});

  PokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokedex =
    json['pokedex'] != null ? ObjPokemon.fromJson(json['pokedex']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entry_number'] = entryNumber;
    if (pokedex != null) {
      data['pokedex'] = pokedex?.toJson();
    }
    return data;
  }
}

class Varieties {
  bool? isDefault;
  ObjPokemon? pokemon;

  Varieties({required this.isDefault, required this.pokemon});

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon =
    json['pokemon'] != null ? ObjPokemon.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_default'] = isDefault;
    if (pokemon != null) {
      data['pokemon'] = pokemon?.toJson();
    }
    return data;
  }
}