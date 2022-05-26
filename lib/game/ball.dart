import 'package:flutter/material.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'game.dart';
import 'game_property.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<BlockBuildingGame> {
  double dx = initBallDx; // 球のX方向移動量
  double dy = initBallDy; // 球のy方向移動量

  late ShapeHitbox hitbox;

  Ball(radius, position) : super(radius: radius, position: position) {
    setColor(Colors.white);
  }

  Future<void> onLoad() async {
    hitbox = CircleHitbox();
    add(hitbox);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position = Vector2(x + dx, y + dy);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    // あたり判定によって動作を変更する

    if (other is ScreenHitbox && x + dx + ballRadius / 2 < 0) {
      // 左端との衝突
      dx = dx * -1; // X軸方向の進行方向を反転
    } else if (x + dx + ballRadius / 2 > gameRef.canvasSize.x) {
      // 右端との衝突
      dx = dx * -1; // X軸方向の進行方向を反転
    } else if (other is ScreenHitbox && y + dy + ballRadius / 2 < 0) {
      // 上端との衝突
      dy = dy * -1; // y軸方向の進行方向を反転
    } else if (y + dy + ballRadius / 2 > gameRef.canvasSize.y) {
      // TODO : ゲーム終了を実装
      dy = dy * -1; // y軸方向の進行方向を反転
    }
  }
}
