import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'components/player.dart';
import 'helpers/direction.dart';

class MyGame extends FlameGame {
  final Player _player = Player();

  @override
  Future<void> onLoad() async {
    final level = await TiledComponent.load('homemap.tmx', Vector2.all(32));
    add(level);

    final objectGroup = level.tileMap.getLayer<ObjectGroup>('AnimatedSink');
    final sink = await Flame.images.load('sink.png');

    for (final object in objectGroup!.objects) {
      add(
        SpriteAnimationComponent(
          position: Vector2(object.x, object.y),
          animation: SpriteAnimation.fromFrameData(
            sink,
            SpriteAnimationData.sequenced(
              amount: 3,
              stepTime: 0.15,
              textureSize: Vector2(62.3529, 64.7059),
            ),
          ),
        ),
      );
    }

    // PLAYER
    add(_player);
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}