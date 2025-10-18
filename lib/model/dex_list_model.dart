import 'package:json_annotation/json_annotation.dart';

part 'dex_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DexListModel {
  String? number;
  String? name;
  String? imageUrl;
  String? thumbnailUrl;
  Sprites? sprites;
  List<String>? types;
  String? specie;
  String? generation;

  DexListModel(
      {this.number,
      this.name,
      this.imageUrl,
      this.thumbnailUrl,
      this.sprites,
      this.types,
      this.specie,
      this.generation});

  factory DexListModel.fromJson(Map<String, dynamic> json) =>
      _$DexListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DexListModelToJson(this);
}

@JsonSerializable()
class Sprites {
  String? mainSpriteUrl;
  String? frontAnimatedSpriteUrl;
  String? backAnimatedSpriteUrl;
  String? frontShinyAnimatedSpriteUrl;
  String? backShinyAnimatedSpriteUrl;

  Sprites(
      {this.mainSpriteUrl,
      this.frontAnimatedSpriteUrl,
      this.backAnimatedSpriteUrl,
      this.backShinyAnimatedSpriteUrl});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
