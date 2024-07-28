import 'package:flame/components.dart';
import 'package:vps_source/main_character/state_machine/states/movement_state.dart';
import 'package:vps_source/main_character/state_machine/states/walking_state.dart';

class IdleState extends MovementState{
  IdleState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    print('idle');
    character.animation = SpriteAnimation.fromFrameData(
        character.characterSprites.image,
        SpriteAnimationData([
          character.characterSprites.createFrameData(2, 0, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 1, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 2, stepTime: 0.1),
          character.characterSprites.createFrameData(2, 3, stepTime: 0.1),
        ])
    );
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);

    if (IsInputZero()) return;
    stateSwitcher.SwitchState<WalkingState>(1);
  }
}