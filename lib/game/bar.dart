import 'package:flame/components.dart';

import 'package:flame/collisions.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

class Bar extends RectangleComponent with CollisionCallbacks {
  late ShapeHitbox hitbox;

  Bar(size, position) : super(size: size, position: position) {
    setColor(const Color(0xFFFFFFFF));
  }

  @override
  Future<void> onLoad() async {
    hitbox = RectangleHitbox();
    add(hitbox);
  }

  void updatePosition(Vector2 newPosition) {
    position = newPosition;
  }
}
