import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Collidable extends PositionComponent{
  Collidable() {
    add(RectangleHitbox());
  }
}
