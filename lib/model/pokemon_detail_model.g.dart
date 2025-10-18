// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DexDetailModel _$DexDetailModelFromJson(Map<String, dynamic> json) =>
    DexDetailModel(
      number: json['number'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      specie: json['specie'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      breeding: json['breeding'] == null
          ? null
          : Breeding.fromJson(json['breeding'] as Map<String, dynamic>),
      training: json['training'] == null
          ? null
          : Training.fromJson(json['training'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      typesEffectiveness:
          (json['typesEffectiveness'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      evolutionChain: (json['evolutionChain'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
      previousEvolutions: (json['previousEvolutions'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextEvolutions: (json['nextEvolutions'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
      superEvolutions: (json['superEvolutions'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseStats: json['baseStats'] == null
          ? null
          : BaseStats.fromJson(json['baseStats'] as Map<String, dynamic>),
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CardInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      soundUrl: json['soundUrl'] as String?,
      moves: json['moves'] == null
          ? null
          : Moves.fromJson(json['moves'] as Map<String, dynamic>),
      generation: json['generation'] as String?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$DexDetailModelToJson(DexDetailModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'sprites': instance.sprites?.toJson(),
      'types': instance.types,
      'weaknesses': instance.weaknesses,
      'descriptions': instance.descriptions,
      'specie': instance.specie,
      'height': instance.height,
      'weight': instance.weight,
      'breeding': instance.breeding?.toJson(),
      'training': instance.training?.toJson(),
      'abilities': instance.abilities?.map((e) => e.toJson()).toList(),
      'typesEffectiveness': instance.typesEffectiveness,
      'evolutionChain':
          instance.evolutionChain?.map((e) => e.toJson()).toList(),
      'previousEvolutions':
          instance.previousEvolutions?.map((e) => e.toJson()).toList(),
      'nextEvolutions':
          instance.nextEvolutions?.map((e) => e.toJson()).toList(),
      'superEvolutions':
          instance.superEvolutions?.map((e) => e.toJson()).toList(),
      'baseStats': instance.baseStats?.toJson(),
      'cards': instance.cards?.map((e) => e.toJson()).toList(),
      'soundUrl': instance.soundUrl,
      'moves': instance.moves?.toJson(),
      'generation': instance.generation,
      'isFavorite': instance.isFavorite,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      mainSpriteUrl: json['mainSpriteUrl'] as String?,
      frontAnimatedSpriteUrl: json['frontAnimatedSpriteUrl'] as String?,
      backAnimatedSpriteUrl: json['backAnimatedSpriteUrl'] as String?,
      frontShinyAnimatedSpriteUrl:
          json['frontShinyAnimatedSpriteUrl'] as String?,
      backShinyAnimatedSpriteUrl: json['backShinyAnimatedSpriteUrl'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'mainSpriteUrl': instance.mainSpriteUrl,
      'frontAnimatedSpriteUrl': instance.frontAnimatedSpriteUrl,
      'backAnimatedSpriteUrl': instance.backAnimatedSpriteUrl,
      'frontShinyAnimatedSpriteUrl': instance.frontShinyAnimatedSpriteUrl,
      'backShinyAnimatedSpriteUrl': instance.backShinyAnimatedSpriteUrl,
    };

Breeding _$BreedingFromJson(Map<String, dynamic> json) => Breeding(
      egg: json['egg'] == null
          ? null
          : Egg.fromJson(json['egg'] as Map<String, dynamic>),
      genders: (json['genders'] as List<dynamic>?)
          ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreedingToJson(Breeding instance) => <String, dynamic>{
      'egg': instance.egg?.toJson(),
      'genders': instance.genders?.map((e) => e.toJson()).toList(),
    };

Egg _$EggFromJson(Map<String, dynamic> json) => Egg(
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cycle: json['cycle'] as String?,
    );

Map<String, dynamic> _$EggToJson(Egg instance) => <String, dynamic>{
      'groups': instance.groups,
      'cycle': instance.cycle,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      type: json['type'] as String?,
      percentage: json['percentage'] as String?,
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'type': instance.type,
      'percentage': instance.percentage,
    };

Training _$TrainingFromJson(Map<String, dynamic> json) => Training(
      evYield: json['evYield'] as String?,
      catchRate: json['catchRate'] as String?,
      baseFriendship: json['baseFriendship'] as String?,
      baseExp: json['baseExp'] as String?,
      growthRate: json['growthRate'] as String?,
    );

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      'evYield': instance.evYield,
      'catchRate': instance.catchRate,
      'baseFriendship': instance.baseFriendship,
      'baseExp': instance.baseExp,
      'growthRate': instance.growthRate,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

Evolution _$EvolutionFromJson(Map<String, dynamic> json) => Evolution(
      number: json['number'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      type: json['type'] as String?,
      requirement: json['requirement'] as String?,
    );

Map<String, dynamic> _$EvolutionToJson(Evolution instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'thumbUrl': instance.thumbUrl,
      'type': instance.type,
      'requirement': instance.requirement,
    };

BaseStats _$BaseStatsFromJson(Map<String, dynamic> json) => BaseStats(
      hp: (json['hp'] as num?)?.toInt(),
      attack: (json['attack'] as num?)?.toInt(),
      defense: (json['defense'] as num?)?.toInt(),
      spAtk: (json['spAtk'] as num?)?.toInt(),
      spDef: (json['spDef'] as num?)?.toInt(),
      speed: (json['speed'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseStatsToJson(BaseStats instance) => <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAtk': instance.spAtk,
      'spDef': instance.spDef,
      'speed': instance.speed,
      'total': instance.total,
    };

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      number: json['number'] as String?,
      name: json['name'] as String?,
      expansionName: json['expansionName'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'expansionName': instance.expansionName,
      'imageUrl': instance.imageUrl,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      levelUp: (json['levelUp'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      technicalMachine: (json['technicalMachine'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      technicalRecords: (json['technicalRecords'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      egg: (json['egg'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      tutor: (json['tutor'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolution: (json['evolution'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      preEvolution: (json['preEvolution'] as List<dynamic>?)
          ?.map((e) => MoveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'levelUp': instance.levelUp?.map((e) => e.toJson()).toList(),
      'technicalMachine':
          instance.technicalMachine?.map((e) => e.toJson()).toList(),
      'technicalRecords':
          instance.technicalRecords?.map((e) => e.toJson()).toList(),
      'egg': instance.egg?.map((e) => e.toJson()).toList(),
      'tutor': instance.tutor?.map((e) => e.toJson()).toList(),
      'evolution': instance.evolution?.map((e) => e.toJson()).toList(),
      'preEvolution': instance.preEvolution?.map((e) => e.toJson()).toList(),
    };

MoveDetail _$MoveDetailFromJson(Map<String, dynamic> json) => MoveDetail(
      level: (json['level'] as num?)?.toInt(),
      technicalMachine: (json['technicalMachine'] as num?)?.toInt(),
      technicalRecord: (json['technicalRecord'] as num?)?.toInt(),
      category: json['category'] as String?,
      move: json['move'] as String?,
      type: json['type'] as String?,
      power: json['power'] as String?,
      accuracy: json['accuracy'] as String?,
    );

Map<String, dynamic> _$MoveDetailToJson(MoveDetail instance) =>
    <String, dynamic>{
      'level': instance.level,
      'technicalMachine': instance.technicalMachine,
      'technicalRecord': instance.technicalRecord,
      'category': instance.category,
      'move': instance.move,
      'type': instance.type,
      'power': instance.power,
      'accuracy': instance.accuracy,
    };
