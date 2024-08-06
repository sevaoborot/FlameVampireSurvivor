import 'package:vps_source/main_character/main_character.dart';
import 'package:vps_source/main_character/state_machine/istate_switcher.dart';
import 'package:vps_source/main_character/state_machine/state_data.dart';
import 'package:vps_source/main_character/state_machine/states/idle_state.dart';
import 'package:vps_source/main_character/state_machine/states/istate.dart';
import 'package:vps_source/main_character/state_machine/states/running_state.dart';
import 'package:vps_source/main_character/state_machine/states/walking_state.dart';

class StateMachine implements IStateSwitcher{

  late IState _currentState;
  late List<IState> _states;

  StateMachine(MainCharacter character){
    StateData data = StateData();
    _states = [
      //сюда прописываем все стейты
      IdleState(this, character, data),
      WalkingState(this, character, data),
      RunningState(this, character, data),
    ];
    _currentState = _states[0];
    _currentState.Enter();
  }

  @override
  void SwitchState<T extends IState>() {
    IState newState = _states.singleWhere((state) => state is T);
    _currentState.Exit();
    _currentState = newState;
    _currentState.Enter();
  }

  HandleInput() => _currentState.HandleInput();
  StateUpdate(double dt) => _currentState.StateUpdate(dt);

}
