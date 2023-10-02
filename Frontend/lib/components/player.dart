import 'package:flame/components.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';
// import 'package:winx_app/components/collision_block.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  final double playerSpeed = 300.0;
  final double animationSpeed = 0.15;

  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late final SpriteAnimation leftAnimation;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation standingAnimation;

  Direction direction = Direction.none;
  // List<CollisionBlock> collisionBlocks = [];

  Player()
      : super(
          size: Vector2.all(70.0),
          position: Vector2(160, 464)
        );

  @override
  Future<void> onLoad() async {
    await _loadAnimations().then((_) => {animation = standingAnimation});
    debugMode = true;
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
    // _checkHorizontalCollisions();
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        animation = upAnimation;
        moveUp(delta);
        break;
      case Direction.down:
        animation = downAnimation;
        moveDown(delta);
        break;
      case Direction.left:
        animation = leftAnimation;
        moveLeft(delta);
        break;
      case Direction.right:
        animation = rightAnimation;
        moveRight(delta);
        break;
      case Direction.none:
        animation = standingAnimation;
        break;
    }
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * playerSpeed));
  }
  void moveUp(double delta) {
    position.add(Vector2(0, delta * -playerSpeed));
  }
  void moveLeft(double delta) {
    position.add(Vector2(delta * -playerSpeed, 0));
  }
  void moveRight(double delta) {
    position.add(Vector2(delta * playerSpeed, 0));
  }
  
  // void _checkHorizontalCollisions() {
  //   for(final block in collisionBlocks) {
  //     // handle collision for blocks that are not the sink
  //     if(!block.isSink) {
  //       if(checkCollision(this, block)) {
          
  //       }
  //     }
  //   }
  // }
}
