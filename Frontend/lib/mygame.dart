import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'components/player.dart';
import 'helpers/direction.dart';
import 'helpers/map_loader.dart';
import 'components/world_collidable.dart';

class MyGame extends FlameGame with HasCollisionDetection{
  final Player player = Player();

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
    add(player);

    // COLLISIONS
    addWorldCollision();
  }

  void addWorldCollision() async =>
    (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
      add(WorldCollidable()
        ..position = Vector2(rect.left, rect.top)
        ..width = rect.width
        ..height = rect.height);
    });


  void onJoypadDirectionChanged(Direction direction) {
    player.direction = direction;
  }
}
