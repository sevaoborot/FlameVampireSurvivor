import 'package:flame/components.dart';
import 'package:vps_source/obj_pool/vampire_coin.dart';

class NewObjectPool{

  List<VampireCoin> _coins = [];

  static NewObjectPool pool = NewObjectPool._();

  NewObjectPool._(); //singleton of the pool

  factory NewObjectPool.instantiate(int startCoinsNumber, VampireCoin AddCoin()){
    if(pool._coins.isEmpty) for (int i = 0; i<startCoinsNumber; i++){
      pool._coins.add(AddCoin());
    } else print('pool exists');
    return pool;
  }

  VampireCoin PoolGet(Vector2 newPosition, VampireCoin AddCoin()){
    for (VampireCoin coin in pool._coins){
      if (coin.isActive == false) {
        coin.setActive(true);
        coin.position = newPosition;
        return coin;
      }
    }
    _PoolAdd(AddCoin);
    pool._coins.last.setActive(true);
    pool._coins.last.position = newPosition;
    return pool._coins.last;
  }

  void PoolRelease(VampireCoin obj){
    obj.setActive(false);
  }

  VampireCoin _PoolAdd(VampireCoin AddCoin()){
    pool._coins.add(AddCoin());
    return pool._coins.last;
  }

  @override
  String toString(){
    int i = 0;
    for(VampireCoin coin in _coins) {

      print(i);
      print(coin.isActive);
      i++;
    }
    return '';
  }

  void number() => print(pool._coins.length);

}