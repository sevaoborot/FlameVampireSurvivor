import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:vps_source/vps_game.dart';
import 'mc_controller.dart';

class MainCharacter extends PositionComponent with HasGameReference<VpsGame>{

  final McController _controller;

  MainCharacter(this._controller) : super();

  static final _paint = Paint()..color = Colors.white;

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  @override
  Future<void> onLoad() async{
    position = size / 2;
    width = 50;
    height = 100;
    anchor = Anchor.center;
  }

  @override
  void update (double dt){
    velocity.x = _controller.horizontalDirection * moveSpeed;
    velocity.y = _controller.verticalDirection * moveSpeed;
    position += velocity * dt;
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }
}