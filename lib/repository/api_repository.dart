import 'package:pokedex/model/dex_list_model.dart';

import '../model/pokemon_detail_model.dart';
import '../services/api_service.dart';

class ApiRepository {
  final ApiService api;

  ApiRepository(this.api);

  Future<List<DexListModel>> getListDex() async {
    final data = await api.getList("pokemons.json");
    return (data as List)
        .take(100)
        .map((item) => DexListModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<DexDetailModel> getDetailPokemon(String number) async {
    final data = await api.get("pokemons/$number.json");
    return DexDetailModel.fromJson(data);
  }
}
