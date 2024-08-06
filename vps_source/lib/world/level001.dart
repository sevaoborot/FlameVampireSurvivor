import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:vps_source/obj_pool/new_object_pool.dart';
import 'package:vps_source/obj_pool/vampire_coin.dart';
import 'package:vps_source/world/level_collisions.dart';

class Level001 extends World{

  final startCoinPosition = Vector2.zero();

  late TiledComponent level;
  late Timer spawner;
  late NewObjectPool coinKeeper;

  final int initCoinsNumber = 50;

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

    coinKeeper = NewObjectPool.instantiate(initCoinsNumber, AddNewCoin);
    coinKeeper.toString();

    spawner = Timer(2,
        onTick: onTick,
        repeat: true);
    spawner.start();

    return super.onLoad();
  }

  @override
  void update(double dt){
    spawner.update(dt);
    super.update(dt);
  }

  void CoinActiveInactive(VampireCoin coin){

    if (!coin.isActive) coin.setActive(true);
    else coin.setActive(false);
  }

  void onTick(){
    coinKeeper.PoolGet(NewPosition(), AddNewCoin);
  }

  VampireCoin AddNewCoin(){
    VampireCoin newCoin = VampireCoin(Vector2(-1000, -1000));
    add(newCoin);
    return newCoin;
  }

  Vector2 NewPosition(){
    return Vector2(Random().nextDouble()*32*38 + 32, Random().nextDouble()*32*23 + 32);
  }
}