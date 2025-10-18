import 'package:flutter/material.dart';
import 'package:pokedex/views/component/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onActionPress;
  final bool? isMarkFav;

  const CustomAppBar(
      {super.key, required this.title, this.onActionPress, this.isMarkFav});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: AppText.bold(
        title,
        color: Colors.white,
        fontSize: 20,
      ),
      actions: onActionPress != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: onActionPress,
                  child: Icon(
                    (isMarkFav ?? false)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
