import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:vps_source/vps_game.dart';

void main() {
  final game = FlameGame();
  runApp(GameWidget(game: VpsGame()));
}