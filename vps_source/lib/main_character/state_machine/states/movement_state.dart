import 'package:flame/components.dart';
import 'package:flutter/services.dart';
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
  MainCharacter get character {return _character;}

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
    _data.xyInput = Vector2(
        _character.controller.horizontalDirection as double,
        _character.controller.verticalDirection as double
    );
    if (_data.xyInput != Vector2.zero())
      _data.xyInputLast = _data.xyInput;
    _data.XVelocity = _data.xyInput.x * _data.speed;
    _data.YVelocity = _data.xyInput.y * _data.speed;
  }

  @override
  void StateUpdate(double dt) {
    _character.position += Vector2(_data.XVelocity, _data.YVelocity) * dt;
  }

  //bool IsInputZero() => _data.xyInput == Vector2.zero();
  bool IsInputZero(){
    if (_character.controller.horizontalDirection == 0 &&
        _character.controller.verticalDirection == 0)
      return true;
    else return false;
  }
  //bool IsInputZero() => _character.controller.currentEvent == KeyUpEvent;

}