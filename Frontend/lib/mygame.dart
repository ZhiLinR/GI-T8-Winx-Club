import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:winx_app/components/collision_block.dart';
import 'components/player.dart';
import 'helpers/direction.dart';

class MyGame extends FlameGame {
  final Player _player = Player();
  List<CollisionBlock> collisionBlocks = [];

  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load('homemap.tmx', Vector2.all(32.0));
    add(map);

    // Animated Sink
    final objectGroup = map.tileMap.getLayer<ObjectGroup>('AnimatedSink');
    final sink = await Flame.images.load('Sink.png');

    for (final object in objectGroup!.objects) {
      add(
        SpriteAnimationComponent(
          position: Vector2(object.x, object.y),
          animation: SpriteAnimation.fromFrameData(
            sink,
            SpriteAnimationData.sequenced(
              amount: 3,
              stepTime: 0.15,
              textureSize: Vector2.all(64.0),
            ),
          ),
        ),
      );
    }

    // PLAYER
    add(_player);

    // COLLISIONS
    final collisionsLayer = map.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        switch (collision.class_) {
          case 'Sink':
            final sink = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isSink: true,
            );
            collisionBlocks.add(sink);
            add(sink);
            break;
          default:
          final block = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),            
          );
          collisionBlocks.add(block);
          add(block);
        }
      }
    }
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
