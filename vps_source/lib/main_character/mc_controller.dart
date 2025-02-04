import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class McController extends Component with KeyboardHandler{

  McController();

  bool _isRunning = false;
  int _horizontalDirection = 0;
  int _verticalDirection = 0;

  int get horizontalDirection {return _horizontalDirection;}
  int get verticalDirection{return _verticalDirection;}
  bool get isRunning{return _isRunning;}

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed){

    final LeftKey = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final RightKey = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final DownKey = keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown);
    final UpKey = keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final ShiftKey = keysPressed.contains(LogicalKeyboardKey.shiftLeft);

     _horizontalDirection = 0;
    _verticalDirection = 0;

      _horizontalDirection += LeftKey
          ? -1
          : 0;
      _horizontalDirection += RightKey
          ? 1
          : 0;
      _verticalDirection += UpKey
          ? -1
          : 0;
      _verticalDirection += DownKey
          ? 1
          : 0;
      _isRunning = ShiftKey
          ? true
          : false;

    return super.onKeyEvent(event, keysPressed);
  }
}