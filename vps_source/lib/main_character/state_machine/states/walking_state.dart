import 'package:vps_source/main_character/state_machine/states/idle_state.dart';
import 'package:vps_source/main_character/state_machine/states/movement_state.dart';

class WalkingState extends MovementState{
  WalkingState(super.stateSwitcher, super.character, super.data);

  @override
  void Enter(){
    super.Enter();
    print('walking state');
  }

  @override
  void StateUpdate(double dt){
    super.StateUpdate(dt);
    if (IsInputZero()) stateSwitcher.SwitchState<IdleState>();
  }
}