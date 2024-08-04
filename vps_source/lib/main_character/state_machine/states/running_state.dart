import 'package:vps_source/main_character/state_machine/states/idle_state.dart';
import 'package:vps_source/main_character/state_machine/states/movement_state.dart';

import 'walking_state.dart';

class RunningState extends MovementState{
  RunningState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    character.animation = character.moveAnimation[data.xyInputLast]
      ?..stepTime = 0.1;
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);
    character.animation = character.moveAnimation[data.xyInputLast]
      ?..stepTime = 0.1;
    if (IsInputZero()) stateSwitcher.SwitchState<IdleState>();
    if (runFactor == 1 && !IsInputZero()) stateSwitcher.SwitchState<WalkingState>();
  }
}