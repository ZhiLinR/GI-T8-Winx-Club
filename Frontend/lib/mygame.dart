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
    final homeMap = await TiledComponent.load('homemap.tmx', Vector2.all(32));
    add(homeMap);

    final objectGroup = homeMap.tileMap.getLayer<ObjectGroup>('AnimatedSink');
    final sink = await Flame.images.load('sink.png');

    for (final object in objectGroup!.objects) {
      world.add(
        SpriteAnimationComponent(
          size: Vector2.all(32.0),
          position: Vector2(object.x, object.y),
          animation: SpriteAnimation.fromFrameData(
            sink,
            SpriteAnimationData.sequenced(
              amount: 3,
              stepTime: .15,
              textureSize: Vector2.all(32),
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