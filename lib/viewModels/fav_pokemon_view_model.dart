import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/pokemon_detail_model.dart';

class FavPokemonState {
  final List<DexDetailModel>? listFavPokemon;

  const FavPokemonState({
    this.listFavPokemon,
  });

  FavPokemonState copyWith({
    List<DexDetailModel>? listFavPokemon,
  }) {
    return FavPokemonState(listFavPokemon: listFavPokemon);
  }
}

class FavPokemonViewModel extends StateNotifier<FavPokemonState> {
  FavPokemonViewModel() : super(const FavPokemonState(listFavPokemon: []));

  void addFavPokemonToList(DexDetailModel data) {
    final currentList = state.listFavPokemon ?? [];

    if (!currentList.any((p) => p.number == data.number)) {
      state = state.copyWith(listFavPokemon: [...currentList, data]);
    }
  }

  void removeFavPokemon(String number) {
    final currentList = state.listFavPokemon ?? [];
    state = state.copyWith(
      listFavPokemon: currentList.where((p) => p.number != number).toList(),
    );
  }

  bool isFavorite(String number) {
    final currentList = state.listFavPokemon ?? [];
    return currentList.any((p) => p.number == number);
  }
}
