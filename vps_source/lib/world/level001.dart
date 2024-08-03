import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:vps_source/main_character/obj_pool/object_pool.dart';
import 'package:vps_source/world/level_collisions.dart';

class Level001 extends World{

  late TiledComponent level;
  late PoolBase coinsPool;
  late Timer spawner;

  int initCoinsNumber = 10;

  @override
  FutureOr<void> onLoad() async {

    debugMode = true;

    await Flame.images.load('Dungeon_Tileset.png');

    level = await TiledComponent.load('level001.tmx', Vector2.all(32));
    add(level);

    final collisionLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');
    if (collisionLayer != null){
      for(final obj in collisionLayer.objects){
        WallCollision collision = WallCollision(
          position: Vector2(obj.x * 2, obj.y * 2),
          size: Vector2(obj.width * 2, obj.height * 2)
        );
        add(collision);
      }


    }



    coinsPool = PoolBase.instantiate(initCoinsNumber);
    coinsPool.toString();

    return super.onLoad();
  }

  @override
  void onMount(){

    spawner = Timer(2,
                    onTick: () => add(coinsPool.PoolGet(Vector2(Random().nextDouble()*32*38 + 32,
                    Random().nextDouble()*32*23 + 32))),
                    repeat: true);
    spawner.start();
    return super.onMount();
  }

  @override
  void update(double dt){
    spawner.update(dt);
    super.update(dt);
  }
}