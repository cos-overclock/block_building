import 'package:flame/collisions.dart';
import 'package:flame/game.dart';

import 'package:block_building/game/ball.dart';
import 'package:block_building/game/bar.dart';
import 'package:block_building/game/game_property.dart';

class BlockBuildingGame extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
    addInitialBall();
    addInitialBar();
    children.register<Ball>();
  }

  void addInitialBall() {
    add(Ball(ballRadius, Vector2(canvasSize.x / 2, (canvasSize.y / 4) * 3)));
  }

  void addInitialBar() {
    add(Bar(Vector2(canvasSize.x * 0.05, 5),
        Vector2(canvasSize.x / 2, ((canvasSize.y / 4) * 3) + 20)));
  }
}
