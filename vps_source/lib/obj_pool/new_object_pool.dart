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
    VampireCoin? obj = null;
    for (VampireCoin coin in _coins){
      if (coin.isActive == false) obj = coin;
      else obj=null;
    }
    if (obj==null) obj = _PoolAdd(AddCoin);
    obj.setActive(true);
    obj.position = newPosition;
    return obj;
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

}