import 'package:flutter/material.dart';
import 'package:pokedex/views/component/app_text.dart';

import '../../model/pokemon_detail_model.dart';
import 'moves_row_item.dart';

class PokemonMovesSection extends StatelessWidget {
  final Moves moves;

  const PokemonMovesSection({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    final moveCategories = {
      'Level Up Moves': moves.levelUp,
      'TM Moves': moves.technicalMachine,
      'TR Moves': moves.technicalRecords,
      'Egg Moves': moves.egg,
      'Tutor Moves': moves.tutor,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: moveCategories.entries.map((entry) {
        final title = entry.key;
        final moveList = entry.value;

        if (moveList?.isEmpty ?? false) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bold(
                title,
                fontSize: 18,
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.tealAccent[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: (moveList ?? []).map((move) {
                    return MoveRow(move: move);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
