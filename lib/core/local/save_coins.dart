import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:hive/hive.dart';

class LocaleCoinsService {
  static late Box<CoinsModel> coinsBox;
  static Future<void> init() async {
    coinsBox = await Hive.openBox<CoinsModel>('coins');
  }

  static Future<void> saveCoins(List<CoinsModel> coins) async {
    await coinsBox.clear();
    await coinsBox.addAll(coins);
  }

  static List<CoinsModel> getCoins() {
    return coinsBox.values.toList();
  }
}
