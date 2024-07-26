import 'package:vps_source/main_character/main_character.dart';
import 'package:vps_source/main_character/state_machine/istate_switcher.dart';
import 'package:vps_source/main_character/state_machine/state_data.dart';
import 'package:vps_source/main_character/state_machine/states/istate.dart';
import 'package:vps_source/main_character/state_machine/states/test_state1.dart';

class StateMachine implements IStateSwitcher{

  late IState _currentState; //яно нужен будет '!' так как не должен быть null
  late List<IState> _states;

  StateMachine(MainCharacter character){
    StateData data = StateData();
    _states = [
      //сюда прописываем все стейты
      TestState1(this, character, data)
    ];
    _currentState = _states[0];
    _currentState.Enter();
  }

  @override
  void SwitchState<T extends IState>() {
    IState state = _states.first;
    _currentState.Exit();
    _currentState = state;
    _currentState.Enter();
  }

}