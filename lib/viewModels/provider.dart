import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/repository/api_repository.dart';
import 'package:pokedex/viewModels/dex_view_model.dart';
import 'package:pokedex/viewModels/fav_pokemon_view_model.dart';
import 'package:pokedex/viewModels/pokemon_detail_view_model.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final apiRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  return ApiRepository(api);
});

final dexListViewModelProvider =
    StateNotifierProvider<DexViewModel, DexListState>((ref) {
  final repo = ref.watch(apiRepositoryProvider);
  return DexViewModel(repo);
});

final pokemonDetailViewModelProvider =
    StateNotifierProvider<PokemonDetailViewModel, PokemonDetailState>((ref) {
  final repo = ref.watch(apiRepositoryProvider);
  return PokemonDetailViewModel(repo);
});

final favPokemonViewModelProvider =
    StateNotifierProvider<FavPokemonViewModel, FavPokemonState>((ref) {
  return FavPokemonViewModel();
});
