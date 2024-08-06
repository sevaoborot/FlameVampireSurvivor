import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsNumber extends PositionComponent{

  late final ValueNotifier<int> coinsNotifier;
  late TextComponent coinTextComponent;

  CoinsNumber(this.coinsNotifier){
    coinsNotifier.addListener(_updateCoinsString);
  }

  @override
  FutureOr<void> onLoad() async{

    coinsNotifier.addListener(_updateCoinsString);

    final textStyle = GoogleFonts.shadowsIntoLight(
        fontSize: 30,
        color: Colors.white
    );
    final defaultTextRenderer = TextPaint(style: textStyle);

    add(SpriteComponent(
      sprite: Sprite(Flame.images.fromCache('coin.png')),
      position: Vector2(10, 3),
      anchor: Anchor.topLeft,
      size: Vector2(30,30)
    ));

    coinTextComponent = TextComponent(
        text: '0',
        position: Vector2(45,0),
        textRenderer: defaultTextRenderer
    );

    add(coinTextComponent);
  }

  @override
  void onRemove(){
    super.onRemove();
  }

  void _updateCoinsString(){
    coinTextComponent.text = '${coinsNotifier.value}';
  }
}