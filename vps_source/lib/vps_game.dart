import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:vps_source/main_character/main_character.dart';
import 'package:vps_source/world/level001.dart';

class VpsGame extends FlameGame with HasKeyboardHandlerComponents{

  late MainCharacter mainCharacter;

  @override
  Future<void> onLoad() async {
    await super.onLoad();


    await Flame.images.loadAll([
      'character_sprites.png'
    ]);

    world = Level001();
    mainCharacter = MainCharacter();
    world.add(mainCharacter);

    camera.viewfinder.visibleGameSize = Vector2(1000, 500);
    camera.viewfinder.position = Vector2(500, 250);
    camera.viewfinder.anchor = Anchor.center;
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 37, 19, 26);
  }
}

Sprite vpsSprite(String ImageFile, double x, double y, double width, double height) {
  return Sprite(
      Flame.images.fromCache(ImageFile),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height)
  );
}

SpriteSheet vpsSpriteSheet(String ImageFile, double width, double height){
  return SpriteSheet(
      image: Flame.images.fromCache(ImageFile),
      srcSize: Vector2(width,height)
  );
}