import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:vps_source/main_character/state_machine/states/idle_state.dart';
import 'package:vps_source/main_character/state_machine/states/movement_state.dart';

class WalkingState extends MovementState{
  WalkingState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    print('walking');
    character.animation = SpriteAnimation.fromFrameData(
        character.characterSprites.image,
        SpriteAnimationData([
          character.characterSprites.createFrameData(2, 4, stepTime: 0.2),
          character.characterSprites.createFrameData(1, 4, stepTime: 0.2),
          character.characterSprites.createFrameData(2, 4, stepTime: 0.2),
          character.characterSprites.createFrameData(3, 4, stepTime: 0.2)
        ])
    );
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);
    //character.position += ChangePosition() * dt;

    if (IsInputZero()) stateSwitcher.SwitchState<IdleState>(0);
  }
}