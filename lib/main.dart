import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/local/save_banks.dart';
import 'package:black_market/core/local/save_coins.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';
import 'package:black_market/myapp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BanksModelAdapter());
  Hive.registerAdapter(CoinsModelAdapter());
  Hive.registerAdapter(LivePriceAdapter());
  Hive.registerAdapter(BankPriceAdapter());
  Hive.registerAdapter(BlackMarketPriceAdapter());
  await Hive.openBox<String>(
      'user'); // Open the Hive box for storing the token

  await LocaleBankService.init();
  await LocaleCoinsService.init();

  DioHelper.initDio();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
          startLocale: const Locale(
            'ar',
          ),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'EG'),
          ],
          path: 'assets/translation',
          child: const MyApp())));
}
