class PokeApiV2 {
  List<Abilities>? abilities;
  int? baseExperience;
  List<GameIndices>? gameIndices;
  int? height;
  List<Null>? heldItems;
  int? id;
  bool ?isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  Ability? species;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokeApiV2(
      {this.abilities,
        this.baseExperience,
        this.gameIndices,
        this.height,
        this.heldItems,
        this.id,
        this.isDefault,
        this.locationAreaEncounters,
        this.moves,
        this.name,
        this.order,
        this.species,
        this.stats,
        this.types,
        this.weight});

  PokeApiV2.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities?.add(Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices?.add(GameIndices.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves?.add(Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species =
    json['species'] != null ? Ability.fromJson(json['species']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats?.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types?.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities?.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    if (gameIndices != null) {
      data['game_indices'] = gameIndices?.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    if (moves != null) {
      data['moves'] = moves?.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['order'] = order;
    if (species != null) {
      data['species'] = species?.toJson();
    }
    if (stats != null) {
      data['stats'] = stats?.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types?.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({required this.ability, required this.isHidden, required this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
    json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability?.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({required this.name, required this.url});

  Ability.fromJson(Map<String, dynamic> json) {
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

class GameIndices {
  int? gameIndex;
  Ability? version;

  GameIndices({required this.gameIndex, required this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version =
    json['version'] != null ? Ability.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    if (version != null) {
      data['version'] = version?.toJson();
    }
    return data;
  }
}

class Moves {
  Ability? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Moves({required this.move, required this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? Ability.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails?.add(VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move?.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] =
          versionGroupDetails?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetails {
  int? levelLearnedAt;
  Ability? moveLearnMethod;
  Ability? versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? Ability.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? Ability.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod?.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup?.toJson();
    }
    return data;
  }
}

class Sprites {
  String? backDefault;
  Null? backFemale;
  String? backShiny;
  Null? backShinyFemale;
  String? frontDefault;
  Null? frontFemale;
  String? frontShiny;
  Null? frontShinyFemale;

  Sprites(
      {required this.backDefault,
        this.backFemale,
        required this.backShiny,
        this.backShinyFemale,
        required this.frontDefault,
        this.frontFemale,
        required this.frontShiny,
        this.frontShinyFemale});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat?.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({required this.slot, required this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type?.toJson();
    }
    return data;
  }
}