import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import 'package:vps_source/vps_game.dart';
import 'mc_controller.dart';
import 'state_machine/state_machine.dart';

class MainCharacter extends SpriteAnimationComponent with HasGameReference<VpsGame>{

  late McController _controller;
  McController get controller {return _controller;}
  late StateMachine _stateMachine;

  late SpriteSheet characterSprites;

  MainCharacter() : super(
    size: Vector2(65, 85),
    anchor: Anchor.center
  );

  @override
  Future<void> onLoad() async{
    position = size / 2;

    characterSprites = await vpsSpriteSheet('character_sprites.png', 16, 24);

    _controller = McController();
    add(_controller);
    _stateMachine = StateMachine(this); //если component не висит, add не прописываем
  }

  @override
  void update (double dt){
    _stateMachine.HandleInput();
    _stateMachine.StateUpdate(dt);
    super.update(dt);
  }

}