import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:hive/hive.dart';

class SaveBankFavorite {
  static late Box<BanksModel> favoriteBox;

  static Future<void> init() async {
    favoriteBox = await Hive.openBox<BanksModel>('favorite');
  }

  static Future<void> saveFavorite(BanksModel bankId) async {
    // Generate a unique key for each item, for example, use the bankId as the key
    await favoriteBox.put(bankId.id, bankId);
  }

  static List<BanksModel> getFavorites() {
    // Retrieve all items using the values property
    return favoriteBox.values.toList();
  }

}

class SaveBankPriceFavorite {
  static late Box<BankPrice> favoriteBox;

  static Future<void> init() async {
    favoriteBox = await Hive.openBox<BankPrice>('favoriteBankPrice');
  }

  static Future<void> saveFavorite(BankPrice coinId) async {
    // Generate a unique key for each item, for example, use the coinId as the key
    await favoriteBox.put(coinId.id, coinId);
  }

  static List<BankPrice> getFavorites() {
    // Retrieve all items using the values property
    return favoriteBox.values.toList();
  }
}

class SaveCoinIdFavorite {
  static late Box<CoinsModel> favoriteBox;

  static Future<void> init() async {
    favoriteBox = await Hive.openBox<CoinsModel>('favoriteCoinId');
  }

  static Future<void> saveFavorite(CoinsModel coinId) async {
    // Generate a unique key for each item, for example, use the coinId as the key
    await favoriteBox.put(coinId.id, coinId);
  }

  static List<CoinsModel> getFavorites() {
    // Retrieve all items using the values property
    return favoriteBox.values.toList();
  }
}
