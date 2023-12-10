import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';
import 'package:black_market/features/home/data/repositories/home_base_repo.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/pages/tabs/coins.dart';
import 'package:black_market/features/home/presentation/pages/tabs/fav.dart';
import 'package:black_market/features/home/presentation/pages/tabs/golds.dart';
import 'package:black_market/features/home/presentation/pages/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.homeBaseRepo,
  ) : super(HomeInitial());
  HomeBaseRepo homeBaseRepo;
  List<CoinsModel>? coinsModel;
  List<BanksModel>? banksModel;
  List<LivePrice>? livePrices;
  List<BankPrice>? bankPrices;
  List<BlackMarketPrice>? blackbankPrices;
  CoinsModel? selectedCoin;
  BankPrice? bankPrice;
  
// CoinsId? coinsId;

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    CoinsScreen(),
    const GoldsScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  int index = 0;
  changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getHomeData();
    result.fold((l) {
      emit(HomeCurrcinesErrorState(l.toString()));
    }, (r) {
      coinsModel = r;
      print(r[1].bankPrices?[1].bankId);
      selectedCoin = r[1];

      emit(HomeCurrcinesSuccessState(
        r,
        livePrices = r[1].livePrices!,
        blackbankPrices = r[1].blackMarketPrices!,
        bankPrices = r[1].bankPrices!,


      ));
    });
  }

  getBanksData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getBanksData();
    result.fold((l) {
      emit(HomeBanksErrorState(l.message.toString()));
    }, (r) {
      banksModel = r.map((e) => e).toList();

      emit(HomeBanksSuccessState(r));
    });
  }

  void updateSelectedCoin(CoinsModel? selectedCoin) {
    this.selectedCoin = selectedCoin;
    print(selectedCoin?.livePrices?[2].price);
    emit(HomeStackWidgetSuccessState(selectedCoin));
  }

  
}
