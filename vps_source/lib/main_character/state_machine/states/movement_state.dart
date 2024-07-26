import 'package:vps_source/main_character/main_character.dart';
import 'package:vps_source/main_character/state_machine/istate_switcher.dart';
import 'package:vps_source/main_character/state_machine/state_data.dart';

import 'istate.dart';

class MovementState implements IState{

  late IStateSwitcher _stateSwitcher;
  late StateData _data;
  late MainCharacter _character;

  IStateSwitcher get stateSwitcher {return _stateSwitcher;}
  StateData get data {return _data;}

  MovementState(IStateSwitcher stateSwitcher, MainCharacter character, StateData data){
    _stateSwitcher = stateSwitcher;
    _data = data;
    _character = character;
  }

  @override
  void Enter() {}

  @override
  void Exit() {}

  @override
  void HandleInput() {

  }

  @override
  void StateUpdate() {

  }

}