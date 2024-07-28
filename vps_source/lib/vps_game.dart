import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:vps_source/main_character/main_character.dart';

class VpsGame extends FlameGame with HasKeyboardHandlerComponents{

  late MainCharacter mainCharacter;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.loadAll([
      'character_sprites.png'
    ]);
    mainCharacter = MainCharacter();
    add(mainCharacter);
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