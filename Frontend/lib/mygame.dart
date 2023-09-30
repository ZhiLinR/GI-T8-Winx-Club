import 'package:flame/game.dart';
import 'components/player.dart';
import 'helpers/direction.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MyGame extends FlameGame {
  final Player _player = Player();

  @override
  Future<void> onLoad() async {
    final homeMap = await TiledComponent.load('homemap.tmx', Vector2.all(32));
    add(homeMap);
    add(_player);
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

}