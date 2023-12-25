import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:hive/hive.dart';

class LocaleBankService {
  static late Box<BanksModel> banksBox;
  static Future<void> init() async {
    banksBox = await Hive.openBox<BanksModel>('banks');
  }

  static Future<void> saveBanks(List<BanksModel> banks) async {
    await banksBox.clear();
    await banksBox.addAll(banks);
  }

  static List<BanksModel> getBanks() {
    return banksBox.values.toList();
  }
}
