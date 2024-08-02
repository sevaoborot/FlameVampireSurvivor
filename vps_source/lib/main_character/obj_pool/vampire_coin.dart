import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:vps_source/vps_game.dart';

class VampireCoin extends SpriteComponent with CollisionCallbacks, HasGameReference<VpsGame> {

  //late int _coinValue;

  VampireCoin(): super(
    size: Vector2.all(8),
    priority: 1
  );

  @override
  Future<void> onLoad() async{
    sprite = Sprite(Flame.images.fromCache('coin.png'));
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other){
    //тут при касании монетки что должно выполняться
    super.onCollisionStart(intersectionPoints, other);
  }

  void addCoins(){
    //тут закидываем в игрока монетку
  }

}