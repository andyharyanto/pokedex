import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/constant/app_constant.dart';
import 'package:pokedex/viewModels/provider.dart';
import 'package:pokedex/views/component/pokemon_item.dart';
import 'package:pokedex/views/fav_pokemon_screen.dart';
import 'package:pokedex/views/pokemon_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(dexListViewModelProvider.notifier).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dexListViewModelProvider);
    return Scaffold(
      body: state.isLoading
          ? Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.asset(lottieLoading)))
          : Column(
              children: [
                SafeArea(
                  top: true,
                  bottom: false,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: Image.asset(
                          iconPokemonLogo,
                        )),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FavPokemonScreen()),
                            );
                          },
                          child: const Icon(Icons.menu),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          (state.listDex?.isNotEmpty ?? false)
                              ? GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 1.3,
                                  children: List.generate(
                                      state.listDex?.length ?? 0, (index) {
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PokemonDetailScreen(
                                                      number: state
                                                              .listDex?[index]
                                                              .number ??
                                                          "001",
                                                      index: index,
                                                    )),
                                          );
                                        },
                                        child: PokemonItem(
                                          index: index,
                                          data: state.listDex?[index],
                                        ));
                                  }))
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
