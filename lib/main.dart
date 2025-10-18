import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/views/splash_screen.dart';

void main() {
  runZonedGuarded(() async {
    runApp(const ProviderScope(child: PokeDexApp()));
  }, (error, stack) {
    debugPrint(stack.toString());
  });
}

class PokeDexApp extends StatelessWidget {
  const PokeDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
