import 'package:flutter/material.dart';

import '../../constant/app_constant.dart';
import '../../model/pokemon_detail_model.dart';

class FavPokemonItem extends StatelessWidget {
  final int index;
  final DexDetailModel? data;

  const FavPokemonItem({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    final color = colors[index % colors.length];
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: Image.asset(
                iconPokeBall,
                color: Colors.white24,
              ),
            ),
            Image.network(
              data?.thumbnailUrl ?? "",
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}
