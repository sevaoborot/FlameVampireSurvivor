import 'package:vps_source/main_character/state_machine/states/istate.dart';

import '../../main_character.dart';
import '../istate_switcher.dart';
import '../state_data.dart';

class TestState1 implements IState{

  late IStateSwitcher _stateSwitcher;
  late StateData _data;
  late MainCharacter _character;

  IStateSwitcher get stateSwitcher {return _stateSwitcher;}
  StateData get data {return _data;}

  TestState1(IStateSwitcher stateSwitcher, MainCharacter character, StateData data){
    _stateSwitcher = stateSwitcher;
    _data = data;
    _character = character;
  }


  @override
  void Enter() {
    print('entering test state');
  }

  @override
  void Exit() {
    // TODO: implement Exit
  }

  @override
  void HandleInput() {
    // TODO: implement HandleInput
  }

  @override
  void StateUpdate() {
    // TODO: implement StateUpdate
  }

}