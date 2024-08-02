import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:vps_source/main_character/obj_pool/vampire_coin.dart';
import 'package:vps_source/world/level_collisions.dart';

class Level001 extends World{

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {

    debugMode = true;

    await Flame.images.load('Dungeon_Tileset.png');

    level = await TiledComponent.load('level001.tmx', Vector2.all(32));
    add(level);

    final collisionLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');
    if (collisionLayer != null){
      int temp = 0;
      for(final obj in collisionLayer.objects){
        WallCollision collision = WallCollision(
          position: Vector2(obj.x * 2, obj.y * 2),
          size: Vector2(obj.width * 2, obj.height * 2)
        );
        temp++;
        add(collision);
      }

      add(SpawnComponent(
        factory: (index) {
          return VampireCoin();
        }, period: 1,
        area: Rectangle.fromLTWH(32, 32, 32*38, 32*23)
      ));
    }

    return super.onLoad();
  }
}