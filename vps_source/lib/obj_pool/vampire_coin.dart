import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:vps_source/obj_pool/icoin_picker.dart';
import 'package:vps_source/obj_pool/new_object_pool.dart';
import 'package:vps_source/vps_game.dart';

class VampireCoin extends SpriteComponent with CollisionCallbacks, HasGameReference<VpsGame> {

  bool _isActive = false;
  bool get isActive {return _isActive;}
  double _coinOpacity = 1;
  CircleHitbox _coinHitbox = CircleHitbox(
    radius: 4,
    collisionType: CollisionType.inactive
  );

  VampireCoin(Vector2 position, [bool status = false]): super(
    size: Vector2.all(8),
    priority: 1,
    position: position
  ) {
    _isActive = status;
  }

  @override
  Future<void> onLoad() async{
    sprite = Sprite(Flame.images.fromCache('coin.png'));
    opacity = 1;
    add(_coinHitbox);
  }

  void setActive(bool status){
    if (status == true) {
      //_coinOpacity = 1;
      _coinHitbox.collisionType = CollisionType.passive;
      _isActive = true;
    } else {
      //_coinOpacity = 0;
      _coinHitbox.collisionType = CollisionType.inactive;
      _isActive = false;
      this.position = Vector2(-1000, -1000);
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other){
    if (other is ICoinPicker) {
      AddCoinTo(other as ICoinPicker);
    }
    NewObjectPool.pool.PoolRelease(this);
    super.onCollisionStart(intersectionPoints, other);
  }

  void AddCoinTo(ICoinPicker picker){
    picker.AddCoin();
    print("adding coin");
  }

}