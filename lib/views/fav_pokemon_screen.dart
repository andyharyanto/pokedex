import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/viewModels/provider.dart';
import 'package:pokedex/views/component/app_text.dart';
import 'package:pokedex/views/component/custom_app_bar.dart';

import 'component/fav_pokemon_item.dart';

class FavPokemonScreen extends ConsumerStatefulWidget {
  const FavPokemonScreen({super.key});

  @override
  ConsumerState<FavPokemonScreen> createState() => _FavPokemonScreenState();
}

class _FavPokemonScreenState extends ConsumerState<FavPokemonScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favPokemonViewModelProvider);
    return Scaffold(
      appBar: const CustomAppBar(title: "Favorite List",),
      backgroundColor: Colors.white24,
      body: (state.listFavPokemon?.isNotEmpty ?? false) ?
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            itemCount: state.listFavPokemon?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) => Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: const Divider(color: Colors.red,)),
            itemBuilder: (context, index) {
              var data = state.listFavPokemon?[index];
              return FavPokemonItem(index: index, data: data,);
            }
        ),
      ) : Center(
        child: AppText.normal("No Data", color: Colors.white,),
      ),
    );
  }
}
