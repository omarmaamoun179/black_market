import 'package:black_market/bloc_observer.dart';
import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/local/save_banks.dart';
import 'package:black_market/core/local/save_coins.dart';
import 'package:black_market/core/local/save_fav.dart';
import 'package:black_market/core/services/awesome_notication.dart';
import 'package:black_market/core/services/backgroun_service.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';
import 'package:black_market/myapp.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();
  BackGroundService.initilaizseService();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BanksModelAdapter());
  Hive.registerAdapter(CoinsModelAdapter());
  Hive.registerAdapter(LivePriceAdapter());
  Hive.registerAdapter(BankPriceAdapter());
  Hive.registerAdapter(BlackMarketPriceAdapter());
  await Hive.openBox<String>('user');
  // Open the Hive box for storing the token
  await Hive.openBox<String>('NewBanksID');

  await LocaleBankService.init();
  await LocaleCoinsService.init();
  await SaveBankFavorite.init();
  await SaveBankPriceFavorite.init();
  await SaveCoinIdFavorite.init();

  DioHelper.initDio();
  runApp(EasyLocalization(
    startLocale: const Locale('ar', 'SA'),
    saveLocale: true,
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'SA'),
    ],
    path: 'assets/translations',
    child: const MyApp(),
  ));
}
