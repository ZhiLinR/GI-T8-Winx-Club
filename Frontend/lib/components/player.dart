import 'package:flame/components.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';



class Player extends SpriteAnimationComponent with HasGameRef {
  final double _playerSpeed = 300.0;
  final double _animationSpeed = 0.15;

  late final SpriteAnimation _upAnimation;
  late final SpriteAnimation _downAnimation;
  late final SpriteAnimation _leftAnimation;
  late final SpriteAnimation _rightAnimation;
  late final SpriteAnimation _standingAnimation;


  Direction direction = Direction.none;

  Player()
      : super(
          size: Vector2.all(90.0),
        );

  @override
  Future<void> onLoad() async {
    await _loadAnimations().then((_) => {animation = _standingAnimation});
}

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('spritesheet.png'),
      srcSize: Vector2(48.0, 48.0),
    );

  _upAnimation =
    spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 6);

  _downAnimation =
    spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 6);
  
  _leftAnimation =
    spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 6);
  
  _rightAnimation =
    spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 6);
  
  _standingAnimation =
    spriteSheet.createAnimation(row: 4, stepTime: _animationSpeed, to: 1);
  }

  @override
  void update(double delta) {
    super.update(delta);
    movePlayer(delta);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        animation = _upAnimation;
        moveUp(delta);
        break;
      case Direction.down:
        animation = _downAnimation;
        moveDown(delta);
        break;
      case Direction.left:
        animation = _leftAnimation;
        moveLeft(delta);
        break;
      case Direction.right:
        animation = _rightAnimation;
        moveRight(delta);
        break;
      case Direction.none:
        animation = _standingAnimation;
        break;
    }
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _playerSpeed));
  }
  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_playerSpeed));
  }
  void moveLeft(double delta) {
    position.add(Vector2(delta * -_playerSpeed, 0));
  }
  void moveRight(double delta) {
    position.add(Vector2(delta * _playerSpeed, 0));
  }
}
