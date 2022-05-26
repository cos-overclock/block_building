import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/game.dart';

void main() {
  final game = BlockBuildingGame();

  runApp(
    GameWidget(game: game),
  );
}
