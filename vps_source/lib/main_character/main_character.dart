import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:vps_source/vps_game.dart';
import 'mc_controller.dart';
import 'state_machine/state_machine.dart';

class MainCharacter extends PositionComponent with HasGameReference<VpsGame>{

  late McController _controller;
  McController get controller {return _controller;}

  late StateMachine _stateMachine;

  MainCharacter() : super();

  static final _paint = Paint()..color = Colors.white;

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  @override
  Future<void> onLoad() async{
    position = size / 2;
    width = 50;
    height = 100;
    anchor = Anchor.center;

    _controller = McController();
    add(_controller);
    _stateMachine = StateMachine(this); //если component не висит, add не прописываем
  }

  @override
  void update (double dt){

    _stateMachine.HandleInput();
    _stateMachine.StateUpdate(dt);

    //то, что ниже, убрать в мувмент стэйт
    //velocity.x = _controller.horizontalDirection * moveSpeed;
    //velocity.y = _controller.verticalDirection * moveSpeed;
    //position += velocity * dt;
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }
}