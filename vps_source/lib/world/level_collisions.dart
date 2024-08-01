import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class WallCollision extends PositionComponent with CollisionCallbacks{

  WallCollision({position, size}) :
      super(
        position: position,
        size: size,
        anchor: Anchor.topLeft
      );

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }
}