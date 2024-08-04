import 'package:vps_source/main_character/state_machine/states/movement_state.dart';
import 'package:vps_source/main_character/state_machine/states/walking_state.dart';

class IdleState extends MovementState{
  IdleState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    character.animation = character.idleAnimations[data.xyInputLast];
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);
    if (IsInputZero()) return;
    stateSwitcher.SwitchState<WalkingState>();
  }
}