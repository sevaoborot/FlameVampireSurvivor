import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class LevelCollision extends PositionComponent with CollisionCallbacks{

  LevelCollision({position, size}) :
      super(
        position: position,
        size: size,
        anchor: Anchor.topLeft
      );

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }
}