import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  bool isSink;
  CollisionBlock({
    position,
    size,
    this.isSink = false,
  }) : super(
          position: position,
          size: size,
        ) {
          debugMode = true;
        }
}
