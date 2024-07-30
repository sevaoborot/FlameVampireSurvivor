import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
//import 'package:tiled/tiled.dart';

class Level001 extends World{

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {

    await Flame.images.load('Dungeon_Tileset.png');

    level = await TiledComponent.load('level001.tmx', Vector2.all(16));
    add(level);

    return super.onLoad();
  }

}