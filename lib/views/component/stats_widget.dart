import 'package:flutter/material.dart';
import 'package:pokedex/views/component/pokemon_stats_bar.dart';

class StatsWidget extends StatelessWidget {
  final Map<dynamic, dynamic> stats;

  const StatsWidget({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stats.entries.map((e) {
        final name = e.key.toUpperCase();
        return PokemonStatBar(
          name: name,
          value: e.value ?? 0,
          color: Colors.green,
        );
      }).toList(),
    );
  }
}
