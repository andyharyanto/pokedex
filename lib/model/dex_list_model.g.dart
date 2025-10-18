// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dex_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DexListModel _$DexListModelFromJson(Map<String, dynamic> json) => DexListModel(
      number: json['number'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specie: json['specie'] as String?,
      generation: json['generation'] as String?,
    );

Map<String, dynamic> _$DexListModelToJson(DexListModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'sprites': instance.sprites?.toJson(),
      'types': instance.types,
      'specie': instance.specie,
      'generation': instance.generation,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      mainSpriteUrl: json['mainSpriteUrl'] as String?,
      frontAnimatedSpriteUrl: json['frontAnimatedSpriteUrl'] as String?,
      backAnimatedSpriteUrl: json['backAnimatedSpriteUrl'] as String?,
      backShinyAnimatedSpriteUrl: json['backShinyAnimatedSpriteUrl'] as String?,
    )..frontShinyAnimatedSpriteUrl =
        json['frontShinyAnimatedSpriteUrl'] as String?;

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'mainSpriteUrl': instance.mainSpriteUrl,
      'frontAnimatedSpriteUrl': instance.frontAnimatedSpriteUrl,
      'backAnimatedSpriteUrl': instance.backAnimatedSpriteUrl,
      'frontShinyAnimatedSpriteUrl': instance.frontShinyAnimatedSpriteUrl,
      'backShinyAnimatedSpriteUrl': instance.backShinyAnimatedSpriteUrl,
    };
