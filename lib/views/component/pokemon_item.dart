import 'package:flutter/material.dart';
import 'package:pokedex/views/component/app_text.dart';

import '../../constant/app_constant.dart';
import '../../model/dex_list_model.dart';

class PokemonItem extends StatelessWidget {
  final int index;
  final DexListModel? data;

  const PokemonItem({super.key, required this.index, this.data});

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
          children: [
            Positioned(
                bottom: -20,
                right: -20,
                child: SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.asset(
                    iconPokeBall,
                    color: Colors.white24,
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      data?.thumbnailUrl ?? "",
                      fit: BoxFit.cover,
                    ))),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.normal(data?.name ?? "", color: Colors.white, fontSize: 18,),
                  const SizedBox(
                    height: 4,
                  ),
                  ...List.generate(
                    data?.types?.length ?? 0,
                    (i) => Container(
                      padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.white24),
                      child: AppText.normal(data?.types?[i] ?? "", color: Colors.white,)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
