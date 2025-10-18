import 'package:flutter/material.dart';
import 'package:pokedex/views/component/app_text.dart';

import '../../model/pokemon_detail_model.dart';

class MoveRow extends StatelessWidget {
  final MoveDetail move;

  const MoveRow({super.key, required this.move});

  @override
  Widget build(BuildContext context) {
    final color = _getTypeColor(move.type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          if (move.level != null)
            AppText.bold(
              "Lv. ${move.level}",
            ),
          if (move.level != null) const SizedBox(width: 12),

          // Type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.5)),
            ),
            child: AppText.bold(
              move.type ?? "",
              fontSize: 12,
              color: color,
            ),
          ),
          const SizedBox(width: 12),

          // Move name
          Expanded(
            child: AppText.bold(
              move.move ?? "",
            ),
          ),

          // Category icon
          _buildCategoryIcon(move.category ?? ""),

          const SizedBox(width: 8),

          // Power & Accuracy
          _buildStatCell(move.power, "PWR"),
          const SizedBox(width: 6),
          _buildStatCell(move.accuracy, "ACC"),
        ],
      ),
    );
  }

  Widget _buildStatCell(String? value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppText.bold(
          value ?? "—",
        ),
        AppText.normal(
          label,
          fontSize: 10,
          color: Colors.grey.shade600,
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(String category) {
    IconData icon;
    Color color;

    switch (category.toLowerCase()) {
      case 'physical':
        icon = Icons.fitness_center;
        color = Colors.orange;
        break;
      case 'special':
        icon = Icons.bolt;
        color = Colors.blueAccent;
        break;
      default:
        icon = Icons.auto_fix_high;
        color = Colors.purpleAccent;
    }

    return Icon(icon, color: color, size: 18);
  }

  Color _getTypeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.redAccent;
      case 'water':
        return Colors.blueAccent;
      case 'poison':
        return Colors.purple;
      case 'normal':
        return Colors.grey;
      case 'psychic':
        return Colors.pinkAccent;
      case 'fairy':
        return Colors.pink;
      default:
        return Colors.teal;
    }
  }
}