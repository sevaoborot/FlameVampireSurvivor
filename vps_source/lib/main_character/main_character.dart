import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:vps_source/obj_pool/icoin_picker.dart';

import 'package:vps_source/vps_game.dart';
import 'package:vps_source/world/level_collisions.dart';
import 'mc_controller.dart';
import 'state_machine/state_machine.dart';

class MainCharacter extends SpriteAnimationComponent with HasGameReference<VpsGame>, CollisionCallbacks
    implements ICoinPicker{

  @override
  bool get debugMode => true;

  late McController _controller;
  McController get controller {return _controller;}
  late StateMachine _stateMachine;

  late final SpriteSheet characterSprites;

  late final Map<Vector2, SpriteAnimation> idleAnimations;
  late final Map<Vector2, SpriteAnimation> moveAnimation;

  MainCharacter() : super(
    size: Vector2(65, 85),
    anchor: Anchor.center,
    priority: 1
  );

  @override
  Future<void> onLoad() async{
    position = Vector2(70, 90);

    characterSprites = await vpsSpriteSheet('character_sprites.png', 16, 24);

    idleAnimations = {
      Vector2(0,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 0, stepTime: 0.1)])
      ),
      Vector2(1,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 1, stepTime: 0.1)])
      ),
      Vector2(1,0): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 2, stepTime: 0.1)])
      ),
      Vector2(1,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 3, stepTime: 0.1)])
      ),
      Vector2(0,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 4, stepTime: 0.1)])
      ),
      Vector2(-1,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 5, stepTime: 0.1)])
      ),
      Vector2(-1,0): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 6, stepTime: 0.1)])
      ),
      Vector2(-1,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([characterSprites.createFrameData(2, 7, stepTime: 0.1)])
      )
    };

    moveAnimation = {
      Vector2(0,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 0, stepTime: 0.15),
            characterSprites.createFrameData(2, 0, stepTime: 0.15),
            characterSprites.createFrameData(3, 0, stepTime: 0.15),
            characterSprites.createFrameData(2, 0, stepTime: 0.15)
          ]),
      ),
      Vector2(1,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 1, stepTime: 0.15),
            characterSprites.createFrameData(2, 1, stepTime: 0.15),
            characterSprites.createFrameData(3, 1, stepTime: 0.15),
            characterSprites.createFrameData(2, 1, stepTime: 0.15)
          ])
      ),
      Vector2(1,0): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 2, stepTime: 0.15),
            characterSprites.createFrameData(2, 2, stepTime: 0.15),
            characterSprites.createFrameData(3, 2, stepTime: 0.15),
            characterSprites.createFrameData(2, 2, stepTime: 0.15)
          ])
      ),
      Vector2(1,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 3, stepTime: 0.15),
            characterSprites.createFrameData(2, 3, stepTime: 0.15),
            characterSprites.createFrameData(3, 3, stepTime: 0.15),
            characterSprites.createFrameData(2, 3, stepTime: 0.15)
          ])
      ),
      Vector2(0,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 4, stepTime: 0.15),
            characterSprites.createFrameData(2, 4, stepTime: 0.15),
            characterSprites.createFrameData(3, 4, stepTime: 0.15),
            characterSprites.createFrameData(2, 4, stepTime: 0.15)
          ])
      ),
      Vector2(-1,1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 5, stepTime: 0.15),
            characterSprites.createFrameData(2, 5, stepTime: 0.15),
            characterSprites.createFrameData(3, 5, stepTime: 0.15),
            characterSprites.createFrameData(2, 5, stepTime: 0.15)
          ])
      ),
      Vector2(-1,0): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 6, stepTime: 0.15),
            characterSprites.createFrameData(2, 6, stepTime: 0.15),
            characterSprites.createFrameData(3, 6, stepTime: 0.15),
            characterSprites.createFrameData(2, 6, stepTime: 0.15)
          ])
      ),
      Vector2(-1,-1): SpriteAnimation.fromFrameData(
          characterSprites.image,
          SpriteAnimationData([
            characterSprites.createFrameData(1, 7, stepTime: 0.15),
            characterSprites.createFrameData(2, 7, stepTime: 0.15),
            characterSprites.createFrameData(3, 7, stepTime: 0.15),
            characterSprites.createFrameData(2, 7, stepTime: 0.15)
          ])
      )
    };

    _controller = McController();
    add(_controller);
    _stateMachine = StateMachine(this); //если component не висит, add не прописываем
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other){

    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other){
    if (other is WallCollision) {
      if (intersectionPoints.length == 2){
        if (intersectionPoints.elementAt(0).x == intersectionPoints.elementAt(1).x) {
          Vector2 mid = (intersectionPoints.elementAt(0) +
              intersectionPoints.elementAt(1)) /2;
          Vector2 collisionNormal = absoluteCenter - mid;
          double separationDistance = (size.x/2) - collisionNormal.length;
          collisionNormal.normalize();
          position += collisionNormal.scaled(separationDistance);
        }
        if (intersectionPoints.elementAt(0).y == intersectionPoints.elementAt(1).y) {
          Vector2 mid = (intersectionPoints.elementAt(0) +
              intersectionPoints.elementAt(1)) /2;
          Vector2 collisionNormal = absoluteCenter - mid;
          double separationDistance = (size.y/2) - collisionNormal.length;
          collisionNormal.normalize();
          position += collisionNormal.scaled(separationDistance);
        }
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other){

    super.onCollisionEnd(other);
  }

  @override
  void update (double dt){
    _stateMachine.HandleInput();
    _stateMachine.StateUpdate(dt);
    super.update(dt);
  }

  int _coinsCollected = 0;

  @override
  void AddCoin() {
    _coinsCollected++;
    printCoins();
  }

  @override
  void printCoins(){
    print(_coinsCollected);
  }

}