import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/repository/api_repository.dart';

import '../model/dex_list_model.dart';

class DexListState {
  final bool isLoading;
  final List<DexListModel>? listDex;
  final String? error;

  const DexListState({
    this.isLoading = false,
    this.listDex,
    this.error,
  });

  DexListState copyWith({
    bool? isLoading,
    List<DexListModel>? listDex,
    String? error,
  }) {
    return DexListState(
      isLoading: isLoading ?? this.isLoading,
      listDex: listDex ?? this.listDex,
      error: error,
    );
  }
}

class DexViewModel extends StateNotifier<DexListState> {
  final ApiRepository repository;

  DexViewModel(this.repository) : super(const DexListState());

  Future<void> fetchUser() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await repository.getListDex();
      state = state.copyWith(isLoading: false, listDex: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
