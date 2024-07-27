import 'package:flame/components.dart';

import 'package:vps_source/vps_game.dart';
import 'mc_controller.dart';
import 'state_machine/state_machine.dart';

class MainCharacter extends SpriteComponent with HasGameReference<VpsGame>{

  late McController _controller;
  McController get controller {return _controller;}
  late StateMachine _stateMachine;

  MainCharacter() : super(
    size: Vector2(100, 100),
    anchor: Anchor.center
  );

  @override
  Future<void> onLoad() async{

    position = size / 2;
    sprite = await vpsSprite('character_sprites.png', 65, 53, 13, 17);

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