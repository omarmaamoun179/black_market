import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeChangeBottomNavState extends HomeState {}

class HomeCurrcinesSuccessState extends HomeState {
  List<CoinsModel> coinsModel;
  List<LivePrice> livePrices;
  List<BlackMarketPrice> blackMarketPrices;

  HomeCurrcinesSuccessState(
    this.coinsModel,
    this.livePrices,
    this.blackMarketPrices,
  );
}

class HomeCurrcinesErrorState extends HomeState {
  final String error;
  HomeCurrcinesErrorState(this.error);
}

class HomeBanksSuccessState extends HomeState {
  List<BanksModel> banksModel;

  HomeBanksSuccessState(this.banksModel);
}

class HomeBanksErrorState extends HomeState {
  final String error;
  HomeBanksErrorState(this.error);
}

class HomeBlackMarketSuccessState extends HomeState {
  List<dynamic> blackMarketModel;
  HomeBlackMarketSuccessState(this.blackMarketModel);
}

class HomeBlackMarketErrorState extends HomeState {
  final String error;
  HomeBlackMarketErrorState(this.error);
}

class HomeLiveSuccessState extends HomeState {
  List<dynamic> liveModel;
  HomeLiveSuccessState(this.liveModel);
}

class HomeLiveErrorState extends HomeState {
  final String error;
  HomeLiveErrorState(this.error);
}
