import 'package:flame/components.dart';

class StateData{
  late double XVelocity = 0;
  late double YVelocity = 0;

  final double speed = 100;

  late Vector2 _xyInput = Vector2.zero();

  Vector2 get xyInput => _xyInput;
  set xyInput(Vector2 value) {
    if (_xyInput.x > 1 || _xyInput.x < -1 || _xyInput.y > 1 || _xyInput.y < -1)
      throw Exception("Unacceptable input value");
    _xyInput = value;
  }

  late Vector2 _xyInputLast = Vector2(0,1);

  Vector2 get xyInputLast => _xyInputLast;
  set xyInputLast(Vector2 value) {
    if (_xyInputLast.x > 1 || _xyInputLast.x < -1 || _xyInputLast.y > 1 || _xyInputLast.y < -1)
      throw Exception("Unacceptable last input value");
    _xyInputLast = value;
  }
}