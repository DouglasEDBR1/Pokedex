class Evolution {
  Null? babyTriggerItem;
  Chain? chain;
  int? id;

  Evolution({this.babyTriggerItem, this.chain, this.id});

  Evolution.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'];
    chain = json['chain'] != null ? Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['baby_trigger_item'] = babyTriggerItem;
    if (chain != null) {
      data['chain'] = chain?.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Chain {
  List<EvolutionDetails>? evolutionDetails;
  List<EvolvesTo>? evolvesTo;
  bool? isBaby;
  Trigger? species;

  Chain({this.evolutionDetails, this.evolvesTo, this.isBaby, this.species});

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = <EvolutionDetails>[];
      json['evolution_details'].forEach((v) {
        evolutionDetails?.add(EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo?.add(EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (evolutionDetails != null) {
      data['evolution_details'] =
          evolutionDetails?.map((v) => v.toJson()).toList();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo?.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    if (species != null) {
      data['species'] = species?.toJson();
    }
    return data;
  }
}

class EvolvesTo {
  List<EvolutionDetails>? evolutionDetails;
  List<EvolvesTo>? evolvesTo;
  bool? isBaby;
  Trigger? species;

  EvolvesTo({this.evolutionDetails, this.evolvesTo, this.isBaby, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = <EvolutionDetails>[];
      json['evolution_details'].forEach((v) {
        evolutionDetails?.add(EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo?.add(EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (evolutionDetails != null) {
      data['evolution_details'] =
          evolutionDetails?.map((v) => v.toJson()).toList();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo?.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    if (species != null) {
      data['species'] = species?.toJson();
    }
    return data;
  }
}

class EvolutionDetails {
  int? minLevel;
  bool? needsOverworldRain;
  String? timeOfDay;
  Trigger? trigger;
  bool? turnUpsideDown;
  Trigger? item;

  EvolutionDetails(
      {this.minLevel,
        this.needsOverworldRain,
        this.timeOfDay,
        this.trigger,
        this.turnUpsideDown,
        this.item,});

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
    needsOverworldRain = json['needs_overworld_rain'];
    timeOfDay = json['time_of_day'];
    item = json['item'] != null ? Trigger.fromJson(json['item']) : null;
    trigger =
    json['trigger'] != null ? Trigger.fromJson(json['trigger']) : null;
    turnUpsideDown = json['turn_upside_down'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_level'] = minLevel;
    data['needs_overworld_rain'] = needsOverworldRain;
    data['time_of_day'] = timeOfDay;
    if (trigger != null) {
      data['trigger'] = trigger?.toJson();
    }
    data['turn_upside_down'] = turnUpsideDown;
    return data;
  }
}

class Trigger {
  String? name;
  String? url;

  Trigger({this.name, this.url});

  Trigger.fromJson(Map<String, dynamic> json) {
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