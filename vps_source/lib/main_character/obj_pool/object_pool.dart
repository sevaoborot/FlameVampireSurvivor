import 'package:flame/components.dart';
import 'package:vps_source/main_character/obj_pool/vampire_coin.dart';

class PoolBase {

  List<VampireCoin> _coins = [];

  static PoolBase pool = PoolBase._();

  PoolBase._(); //singleton of the pool

  factory PoolBase.instantiate(int startCoinsNumber){
    if(pool._coins.isEmpty) for (int i = 0; i<startCoinsNumber; i++){
      pool._coins.add(VampireCoin(Vector2.zero()));
    } else print('pool exists');
    return pool;
  }

  VampireCoin PoolGet(Vector2 newPosition){ //достаём объект из пула

    VampireCoin? obj = null;
    obj = pool._coins.firstWhere(
      (VampireCoin coin) => coin.isActive == false,
      orElse: obj = null
    );
    if (obj == null) obj = _PoolAdd();
    obj.setActive(true);
    obj.position = newPosition;
    return obj;
  }

  void PoolRelease(VampireCoin obj){ //засовываем объект обратно в пул
    obj.setActive(false);
  }

  VampireCoin _PoolAdd(){ //добавляем объект в пул, если нам не хватает изначального кол-ва
    VampireCoin newCoin = VampireCoin(Vector2.zero());
    pool._coins.add(newCoin);
    return newCoin;
  }

  @override
  String toString(){
    for(VampireCoin coin in _coins) print(coin);
    return '';
  }
}