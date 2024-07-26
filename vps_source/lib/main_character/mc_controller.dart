import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class McController extends Component with KeyboardHandler{

  McController();

  int _horizontalDirection = 0;
  int _verticalDirection = 0;

  int get horizontalDirection {return _horizontalDirection;}
  int get verticalDirection{return _verticalDirection;}

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed){
    _horizontalDirection = 0;
    _verticalDirection = 0;
    _horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    _horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    _verticalDirection += (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp))
        ? -1
        : 0;
    _verticalDirection += (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown))
        ? 1
        : 0;
    return super.onKeyEvent(event, keysPressed);
  }
}