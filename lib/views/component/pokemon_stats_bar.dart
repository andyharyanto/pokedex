import 'package:flutter/material.dart';
import 'package:pokedex/views/component/app_text.dart';

class PokemonStatBar extends StatelessWidget {
  final String name;
  final int value;
  final int maxValue;
  final Color color;

  const PokemonStatBar({
    super.key,
    required this.name,
    required this.value,
    this.maxValue = 100,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = value / (name == "TOTAL" ? 600 : maxValue);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppText.bold(name)
          ),
          Expanded(
            flex: 1,
            child:
            AppText.bold(value.toString())
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 5,
                backgroundColor: Colors.grey.shade300,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
