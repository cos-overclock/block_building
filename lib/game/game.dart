import 'package:block_building/game/ball.dart';
import 'package:block_building/game/game_property.dart';
import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class BlockBuildingGame extends FlameGame
    with HasCollisionDetection, TapDetector {
  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
    addInitialBall();
    children.register<Ball>();
  }

  void onTapDown(TapDownInfo info) {
    add(Ball(ballRadius, info.eventPosition.game));
  }

  void addInitialBall() {
    add(Ball(ballRadius, Vector2(canvasSize.x / 2, (canvasSize.y / 4) * 3)));
  }
}
