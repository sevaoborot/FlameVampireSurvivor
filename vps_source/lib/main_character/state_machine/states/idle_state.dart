import 'package:flame/components.dart';
import 'package:vps_source/main_character/state_machine/states/movement_state.dart';
import 'package:vps_source/main_character/state_machine/states/walking_state.dart';

class IdleState extends MovementState{
  IdleState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    //print('idle');
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);
    character.animation = SpriteAnimation.fromFrameData(
        character.characterSprites.image,
        SpriteAnimationData([
          character.characterSprites.createFrameData(2, 0, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 1, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 2, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 3, stepTime: 0.1),
        ])
    );
    if (IsInputZero()) return;
    stateSwitcher.SwitchState<WalkingState>();
  }
}