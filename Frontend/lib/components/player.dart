import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';
import 'collidable.dart';



class Player extends SpriteAnimationComponent with HasGameRef, CollisionCallbacks {
  final double playerSpeed = 300.0;
  final double animationSpeed = 0.15;

  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late final SpriteAnimation leftAnimation;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation standingAnimation;

  Direction direction = Direction.none;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;


  Player()
      : super(
          size: Vector2.all(70.0),
          position: Vector2(160, 464),
        ) {
    add(CircleHitbox());
  }

  @override
  Future<void> onLoad() async {
    await _loadAnimations().then((_) => {animation = standingAnimation});
}

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('spritesheet.png'),
      srcSize: Vector2(48.0, 48.0),
    );

  upAnimation =
    spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, to: 6);

  downAnimation =
    spriteSheet.createAnimation(row: 1, stepTime: animationSpeed, to: 6);
  
  leftAnimation =
    spriteSheet.createAnimation(row: 2, stepTime: animationSpeed, to: 6);
  
  rightAnimation =
    spriteSheet.createAnimation(row: 3, stepTime: animationSpeed, to: 6);
  
  standingAnimation =
    spriteSheet.createAnimation(row: 4, stepTime: animationSpeed, to: 1);
  }

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  // COLLISIONS
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Collidable) {
      if (!_hasCollided) {
        _hasCollided = true;
        _collisionDirection = direction;
      }
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _hasCollided = false;
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          animation = upAnimation;
          moveUp(delta);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          animation = downAnimation;
          moveDown(delta);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          animation = leftAnimation;
          moveLeft(delta);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          animation = rightAnimation;
          moveRight(delta);
        }
        break;
      case Direction.none:
        animation = standingAnimation;
        break;
    }
  }

  bool canPlayerMoveUp() {
    if (_hasCollided && _collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (_hasCollided && _collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (_hasCollided && _collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (_hasCollided && _collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }


  void moveUp(double delta) {
    position.add(Vector2(0, delta * -playerSpeed));
  }
  void moveDown(double delta) {
    position.add(Vector2(0, delta * playerSpeed));
  }
  void moveLeft(double delta) {
    position.add(Vector2(delta * -playerSpeed, 0));
  }
  void moveRight(double delta) {
    position.add(Vector2(delta * playerSpeed, 0));
  }
}
