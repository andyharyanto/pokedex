import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_detail_model.dart';
import 'package:pokedex/repository/api_repository.dart';

class PokemonDetailState {
  final bool isLoading;
  final DexDetailModel? detailPokemon;
  final String? error;

  const PokemonDetailState({
    this.isLoading = false,
    this.detailPokemon,
    this.error,
  });

  PokemonDetailState copyWith({
    bool? isLoading,
    DexDetailModel? detailPokemon,
    String? error,
  }) {
    return PokemonDetailState(
      isLoading: isLoading ?? this.isLoading,
      detailPokemon: detailPokemon,
      error: error,
    );
  }
}

class PokemonDetailViewModel extends StateNotifier<PokemonDetailState> {
  final ApiRepository repository;

  PokemonDetailViewModel(this.repository) : super(const PokemonDetailState());

  Future<void> fetchDetail(String number) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await repository.getDetailPokemon(number);
      state = state.copyWith(isLoading: false, detailPokemon: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
