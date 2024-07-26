import 'package:flame/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vps_source/vps_game.dart';

class MainCharacter extends PositionComponent with KeyboardHandler, HasGameReference<VpsGame>{

  static final _paint = Paint()..color = Colors.white;

  int _horizontalDirection = 0;
  int _verticalDirection = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  @override
  void update (double dt){
    velocity.x = _horizontalDirection * moveSpeed;
    velocity.y = _verticalDirection * moveSpeed;
    position += velocity * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
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

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }
}