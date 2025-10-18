import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DexDetailModel {
  String? number;
  String? name;
  String? imageUrl;
  String? thumbnailUrl;
  Sprites? sprites;
  List<String>? types;
  List<String>? weaknesses;
  List<String>? descriptions;
  String? specie;
  String? height;
  String? weight;
  Breeding? breeding;
  Training? training;
  List<Ability>? abilities;
  Map<String, String>? typesEffectiveness;
  List<Evolution>? evolutionChain;
  List<Evolution>? previousEvolutions;
  List<Evolution>? nextEvolutions;
  List<Evolution>? superEvolutions;
  BaseStats? baseStats;
  List<CardInfo>? cards;
  String? soundUrl;
  Moves? moves;
  String? generation;
  bool? isFavorite;

  DexDetailModel({
    this.number,
    this.name,
    this.imageUrl,
    this.thumbnailUrl,
    this.sprites,
    this.types,
    this.weaknesses,
    this.descriptions,
    this.specie,
    this.height,
    this.weight,
    this.breeding,
    this.training,
    this.abilities,
    this.typesEffectiveness,
    this.evolutionChain,
    this.previousEvolutions,
    this.nextEvolutions,
    this.superEvolutions,
    this.baseStats,
    this.cards,
    this.soundUrl,
    this.moves,
    this.generation,
    this.isFavorite
  });

  factory DexDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DexDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DexDetailModelToJson(this);
}

@JsonSerializable()
class Sprites {
  String? mainSpriteUrl;
  String? frontAnimatedSpriteUrl;
  String? backAnimatedSpriteUrl;
  String? frontShinyAnimatedSpriteUrl;
  String? backShinyAnimatedSpriteUrl;

  Sprites({
    this.mainSpriteUrl,
    this.frontAnimatedSpriteUrl,
    this.backAnimatedSpriteUrl,
    this.frontShinyAnimatedSpriteUrl,
    this.backShinyAnimatedSpriteUrl,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Breeding {
  Egg? egg;
  List<Gender>? genders;

  Breeding({this.egg, this.genders});

  factory Breeding.fromJson(Map<String, dynamic> json) =>
      _$BreedingFromJson(json);

  Map<String, dynamic> toJson() => _$BreedingToJson(this);
}

@JsonSerializable()
class Egg {
  List<String>? groups;
  String? cycle;

  Egg({this.groups, this.cycle});

  factory Egg.fromJson(Map<String, dynamic> json) => _$EggFromJson(json);

  Map<String, dynamic> toJson() => _$EggToJson(this);
}

@JsonSerializable()
class Gender {
  String? type;
  String? percentage;

  Gender({this.type, this.percentage});

  factory Gender.fromJson(Map<String, dynamic> json) =>
      _$GenderFromJson(json);

  Map<String, dynamic> toJson() => _$GenderToJson(this);
}

@JsonSerializable()
class Training {
  String? evYield;
  String? catchRate;
  String? baseFriendship;
  String? baseExp;
  String? growthRate;

  Training({
    this.evYield,
    this.catchRate,
    this.baseFriendship,
    this.baseExp,
    this.growthRate,
  });

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}

@JsonSerializable()
class Ability {
  String? name;
  String? description;

  Ability({this.name, this.description});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Evolution {
  String? number;
  String? name;
  String? imageUrl;
  String? thumbUrl;
  String? type;
  String? requirement;

  Evolution({
    this.number,
    this.name,
    this.imageUrl,
    this.thumbUrl,
    this.type,
    this.requirement,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) =>
      _$EvolutionFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionToJson(this);
}

@JsonSerializable()
class BaseStats {
  int? hp;
  int? attack;
  int? defense;
  int? spAtk;
  int? spDef;
  int? speed;
  int? total;

  BaseStats({
    this.hp,
    this.attack,
    this.defense,
    this.spAtk,
    this.spDef,
    this.speed,
    this.total,
  });

  factory BaseStats.fromJson(Map<String, dynamic> json) =>
      _$BaseStatsFromJson(json);

  Map<String, dynamic> toJson() => _$BaseStatsToJson(this);
}

@JsonSerializable()
class CardInfo {
  String? number;
  String? name;
  String? expansionName;
  String? imageUrl;

  CardInfo({
    this.number,
    this.name,
    this.expansionName,
    this.imageUrl,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CardInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Moves {
  List<MoveDetail>? levelUp;
  List<MoveDetail>? technicalMachine;
  List<MoveDetail>? technicalRecords;
  List<MoveDetail>? egg;
  List<MoveDetail>? tutor;
  List<MoveDetail>? evolution;
  List<MoveDetail>? preEvolution;

  Moves({
    this.levelUp,
    this.technicalMachine,
    this.technicalRecords,
    this.egg,
    this.tutor,
    this.evolution,
    this.preEvolution,
  });

  factory Moves.fromJson(Map<String, dynamic> json) =>
      _$MovesFromJson(json);

  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class MoveDetail {
  int? level;
  int? technicalMachine;
  int? technicalRecord;
  String? category;
  String? move;
  String? type;
  String? power;
  String? accuracy;

  MoveDetail({
    this.level,
    this.technicalMachine,
    this.technicalRecord,
    this.category,
    this.move,
    this.type,
    this.power,
    this.accuracy,
  });

  factory MoveDetail.fromJson(Map<String, dynamic> json) =>
      _$MoveDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MoveDetailToJson(this);
}
