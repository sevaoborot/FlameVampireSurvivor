import 'package:flame/components.dart';

class StateData{
  late double XVelocity = 0;
  late double YVelocity = 0;

  late  double _speed;

  double get speed => _speed = 100;

  //то, что ниже, можно убрать в принципе
  //set speed(double value) {
  //  if (value < 0) throw Exception("Unacceptable speed value");
  //  _speed = value;
  //}

  late Vector2 _xyInput = Vector2.zero();

  Vector2 get xyInput => _xyInput;
  set xyInput(Vector2 value) {
    if (_xyInput.x > 1 || _xyInput.x < -1 || _xyInput.y > 1 || _xyInput.y < -1)
      throw Exception("Unacceptable input value");
    _xyInput = value;
  }
}