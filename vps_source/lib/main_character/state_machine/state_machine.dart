import 'package:vps_source/main_character/state_machine/istate_switcher.dart';
import 'package:vps_source/main_character/state_machine/states/istate.dart';

class StateMachine implements IStateSwitcher{

  late IState _currentState; //яно нужен будет '!' так как не должен быть null
  late List<IState> _states;

  StateMachine(){

  }

  @override
  void SwitchState<T extends IState>() {
    IState state = _states.first;
    _currentState.Exit();
    _currentState = state;
    _currentState.Enter();
  }


}