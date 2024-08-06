import 'states/istate.dart';

abstract class IStateSwitcher{
  void SwitchState<T extends IState>();
}