import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/helper/helper.dart';
import 'package:pokedex/viewModels/provider.dart';
import 'package:pokedex/views/component/app_text.dart';
import 'package:pokedex/views/component/custom_app_bar.dart';
import 'package:pokedex/views/component/pokemon_moves_section.dart';

import '../constant/app_constant.dart';
import '../model/pokemon_detail_model.dart';
import 'component/stats_widget.dart';

class PokemonDetailScreen extends ConsumerStatefulWidget {
  final String number;
  final int index;

  const PokemonDetailScreen(
      {super.key, required this.number, required this.index});

  @override
  ConsumerState<PokemonDetailScreen> createState() =>
      _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends ConsumerState<PokemonDetailScreen>
    with TickerProviderStateMixin {
  late String number;
  late int index;

  late TabController _tabController;

  final List<String> tabs = [
    "About",
    "Base Stats",
    "Moves",
    "Evolutions",
    "Abilities",
  ];

  Color? bgColor;

  final List<GlobalKey> _tabKeys = [];
  final GlobalKey _headerKeys = GlobalKey();
  double _currentTabHeight = 0.0;

  @override
  void initState() {
    number = widget.number;
    index = widget.index;

    bgColor = colors[index % colors.length];

    for (int i = 0; i < tabs.length; i++) {
      _tabKeys.add(GlobalKey());
    }

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_updateHeight);

    // Wait until first frame finishes (transition completed)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(pokemonDetailViewModelProvider.notifier)
          .fetchDetail(number)
          .then((_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _updateHeight();
        });
      });
    });

    super.initState();
  }

  void _updateHeight() {
    if (!mounted) return;

    final headerHeight = Helper.getWidgetHeight(_headerKeys.currentContext);
    final contentHeight =
        Helper.getWidgetHeight(_tabKeys[_tabController.index].currentContext);

    if (headerHeight == null || contentHeight == null) return;

    final availableHeight =
        Helper.calculateAvailableHeight(context, headerHeight);
    final newHeight = max(contentHeight, availableHeight);

    if (_currentTabHeight != newHeight) {
      setState(() => _currentTabHeight = newHeight);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_updateHeight);
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pokemonDetailViewModelProvider);
    final favVM = ref.watch(favPokemonViewModelProvider.notifier);

    return Scaffold(
        appBar: CustomAppBar(
          title: "Pokemon Detail",
          onActionPress: () {
            if (state.isLoading) return;

            if (favVM.isFavorite(number)) {
              favVM.removeFavPokemon(number);
              return;
            }

            favVM.addFavPokemonToList(state.detailPokemon!);
          },
          isMarkFav: favVM.isFavorite(number),
        ),
        backgroundColor: bgColor,
        body: state.isLoading
            ? Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Lottie.asset(lottieLoading)))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //header
                    Column(
                      key: _headerKeys,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.bold(
                                      state.detailPokemon?.name ?? "",
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 8),
                                    ...List.generate(
                                      state.detailPokemon?.types?.length ?? 0,
                                      (i) => Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 6, 20, 6),
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.white24),
                                        child: AppText.normal(
                                          state.detailPokemon?.types?[i] ?? "",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AppText.bold(
                                '#$number',
                                color: Colors.white,
                                fontSize: 16,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                bottom: 20,
                                right: 0,
                                child: Image.asset(
                                  iconPokeBall,
                                  color: Colors.white24,
                                  width: 200,
                                  height: 200,
                                )),
                            Positioned(
                                left: 20,
                                child: Image.asset(
                                  iconDotLine,
                                  color: Colors.white24,
                                  width: 200,
                                  height: 200,
                                )),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.network(
                                state.detailPokemon?.imageUrl ?? "",
                                width: 220,
                                height: 220,
                                errorBuilder: (context, url, error) =>
                                    Container(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: kToolbarHeight,
                            child: TabBar(
                              controller: _tabController,
                              tabAlignment: TabAlignment.center,
                              isScrollable: true,
                              labelColor: bgColor,
                              unselectedLabelColor: Colors.grey,
                              physics: const BouncingScrollPhysics(),
                              indicatorColor: Colors.red,
                              tabs: tabs.map((t) => Tab(text: t)).toList(),
                              dividerHeight: 0,
                            ),
                          ),
                          AnimatedContainer(
                            height: _currentTabHeight,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: TabBarView(
                              controller: _tabController,
                              children: tabs.map((content) {
                                int index = tabs.indexOf(content);
                                return OverflowBox(
                                  maxHeight: double.infinity,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: KeyedSubtree(
                                      key: _tabKeys[index],
                                      child: _buildCurrentTab(
                                          index, state.detailPokemon),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }

  Widget _buildCurrentTab(int index, DexDetailModel? data) {
    switch (index) {
      case 0:
        return _buildAboutTab(data);
      case 1:
        return _buildStatsTab(data);
      case 2:
        return _buildMoves(data);
      case 3:
        return _buildEvolutionsTab(data);
      default:
        return _buildAbilitiesTab(data?.abilities ?? []);
    }
  }

  Widget _buildAboutTab(DexDetailModel? data) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 1, child: AppText.normal("Species ")),
                Expanded(flex: 2, child: AppText.normal(data?.specie ?? ""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 1, child: AppText.normal("Height ")),
                Expanded(flex: 2, child: AppText.normal("${data?.height} cm"))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 1, child: AppText.normal("Weight ")),
                Expanded(flex: 2, child: AppText.normal("${data?.weight} kg"))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 1, child: AppText.normal("Abilities ")),
                Expanded(
                  flex: 2,
                  child: AppText.normal(
                    data?.abilities?.map((a) => a.name).join(', ') ?? '-',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            AppText.bold(
              "Breeding",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(flex: 1, child: AppText.normal("Gender")),
                Expanded(
                    flex: 2,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          for (final gender
                              in data?.breeding?.genders ?? []) ...[
                            WidgetSpan(
                              child: Icon(
                                gender.type == 'MALE'
                                    ? Icons.male
                                    : gender.type == 'FEMALE'
                                        ? Icons.female
                                        : Icons.not_interested,
                                size: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' ${gender.percentage ?? "No Data"}  ',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(data?.breeding?.egg?.groups?.length ?? 0,
                  (index) {
                final label = index == 0 ? "Egg Cycle" : "Egg Groups";
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: AppText.normal(label)),
                      Expanded(
                          flex: 2,
                          child: AppText.normal(data?.breeding?.egg?.groups?[index] ?? "")),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      );

  Widget _buildStatsTab(DexDetailModel? data) => Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatsWidget(stats: data?.baseStats?.toJson() ?? {}),
              const SizedBox(height: 16),
              AppText.bold("Type Defenses", fontSize: 16,),
              const SizedBox(height: 16),
              AppText.normal("The effectiveness of each type on ${data?.name}."),
              const SizedBox(height: 16),
              statsDefense(data?.typesEffectiveness ?? {}),
            ]),
      );

  Widget _buildMoves(DexDetailModel? data) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: PokemonMovesSection(moves: data?.moves ?? Moves()));
  }

  Widget _buildEvolutionsTab(DexDetailModel? data) => Container(
    padding: const EdgeInsets.all(16.0),
    child:
    Column(children: [buildEvolutionChain(data?.evolutionChain ?? [])]),
  );

  Widget _buildAbilitiesTab(List<Ability> abilities) {
    if (abilities.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: AppText.normal(
            "No abilities available.",
            color: Colors.grey,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...abilities.map((ability) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Ability Name
                Row(
                  children: [
                    const Icon(Icons.bolt, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    AppText.bold(
                      ability.name ?? "",
                      fontSize: 18,
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                AppText.normal(
                  ability.description ?? "",
                  color: Colors.grey.shade700,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget statsDefense(Map<dynamic, dynamic> data) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: data.entries.toList().asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final type = item.key;
        final multiplier = item.value;
        final colorText = colors[(index + 1) % colors.length];

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: bgColor?.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: bgColor?.withOpacity(0.6) ?? Colors.white),
          ),
          child: AppText.bold(
            "$type ×$multiplier",
            color: colorText,
          ),
        );
      }).toList(),
    );
  }

  // EvolutionChain
  Widget buildEvolutionChain(List<Evolution> evolutionChains) {
    return evolutionChains.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bold(
                  "Evolution Chain",
                  fontSize: 18,
                ),
                const SizedBox(height: 12),
                ...List.generate(evolutionChains.length - 1, (i) {
                  final current = evolutionChains[i];
                  final next = evolutionChains[i + 1];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildPokemonEvolutionItem(current),
                        Column(
                          children: [
                            const Icon(Icons.arrow_forward, color: Colors.grey),
                            const SizedBox(height: 4),
                            if (next.requirement != null)
                              AppText.normal(
                                "(${next.requirement})",
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                          ],
                        ),
                        _buildPokemonEvolutionItem(next),
                      ],
                    ),
                  );
                }),
              ],
            ),
        )
        : Container();
  }

  Widget _buildPokemonEvolutionItem(Evolution evo) {
    return Column(
      children: [
        Image.network(
          evo.imageUrl ?? "",
          width: 70,
          height: 70,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        AppText.bold(
          evo.name ?? "",
        ),
      ],
    );
  }
}
