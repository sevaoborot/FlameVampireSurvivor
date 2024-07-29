import 'package:vps_source/main_character/state_machine/states/istate.dart';

abstract class IStateSwitcher{
  void SwitchState<T extends IState>();
}