import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:vps_source/main_character/main_character.dart';

class VpsGame extends FlameGame with HasKeyboardHandlerComponents{
  VpsGame();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MainCharacter()
        ..position = size / 2
        ..width = 50
        ..height = 100
        ..anchor = Anchor.center
    );
  }
}