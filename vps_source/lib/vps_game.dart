import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:vps_source/main_character/main_character.dart';
import 'package:vps_source/main_character/mc_controller.dart';

class VpsGame extends FlameGame with HasKeyboardHandlerComponents{

  late MainCharacter mainCharacter;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    mainCharacter = MainCharacter();
    add(mainCharacter);
  }
}