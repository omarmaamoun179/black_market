import 'package:black_market/core/local/save_fav.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/chart_model/chart_model.dart';
import 'package:black_market/features/home/data/models/chart_model/currency_id.dart';
import 'package:black_market/features/home/data/models/chart_model/currency_id_blackm.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/compnies_model/compnies_model.dart';
import 'package:black_market/features/home/data/models/golds_model/golds_model.dart';
import 'package:black_market/features/home/data/models/ingots_model/ingot.dart';
import 'package:black_market/features/home/data/models/ingots_model/ingots_model.dart';
import 'package:black_market/features/home/data/repositories/home_base_repo.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/pages/tabs/coins_screen.dart';
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
  CoinsModel? selectedCoin;
  List<GoldsModel> goldsModel = [];
  List<CompniesModel> compniesModel = [];
  IngotsModel? ingotsModel;
  CompniesModel? selectedCompnies;
  List<Ingot> btcIngotInfo = [];
  ChartModel? chartModel;
  List<CurrencyId>? currencyId;
  List<CurrencyIdBlack>? currencyIdBlack;

  Set<int> favoriteBankIds = {};

  Set<int> favoriteCoinIds = {};

  List favBank = [];
  List<BankFavItemWidget> loadedFavItems = [];

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const CoinsScreen(),
    const GoldsScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  List<String> tabs = ['الذهب', 'السبائك', 'العملات'];

  int selectedIndex = 0;
  int textIndex = 0;
  bool isClicked = false;

  int currentIndex = 0;
  int index = 0;
  DateTime? startDate;

  changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  changeTab(int index) {
    emit(HomeLoadingState());
    selectedIndex = index;
    emit(HomeChangeTabState());
  }

  getHomeData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getHomeData();
    result.fold((l) {
      emit(HomeCurrcinesErrorState(l.message));
    }, (r) {
      coinsModel = r;
      // print(r[1].bankPrices?[1].bankId);
      selectedCoin = r[1];

      emit(HomeCurrcinesSuccessState(
        r,
      ));
    });
  }

  getBanksData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getBanksData();
    result.fold((l) {
      emit(HomeBanksErrorState(l.message));
    }, (r) {
      banksModel = r.map((e) => e).toList();

      emit(HomeBanksSuccessState(r));
    });
  }

  void updateSelectedCoin(CoinsModel? selectedCoin) {
    this.selectedCoin = selectedCoin;
    // print(selectedCoin?.id);
    emit(HomeStackWidgetSuccessState(selectedCoin));
  }
// void to update about select compines

  updateSelectedCompnies(CompniesModel selecetCompines, int index) async {
    selectedCompnies = selecetCompines;
    textIndex = index;
    isClicked = !isClicked;

    // print(selectedCompnies?.id);
    // print(selectedCompnies?.name);

    emit(HomeUpdateCompniesState(
      selecetCompines,
    ));
  }

  updateSelectGold(GoldsModel model) {
    for (var element in goldsModel) {
      element.karat = model.karat;
      print(element.karat);
    }
  }

  getGoldData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getGoldsData();
    result.fold((l) {
      emit(HomeGoldsErrorState(l.message));
    }, (r) {
      goldsModel = r;
      emit(HomeGoldsSuccessState(r));
    });
  }

  getCompniesData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getCompaniesData();
    result.fold((l) {
      emit(HomeCompaniesErrorState(l.message));
    }, (r) {
      compniesModel = r;
      selectedCompnies = r[0];
      emit(HomeCompaniesSuccessState(r));
    });
  }

  getIngotsData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getIngotsData();
    result.fold((l) {
      emit(HomeIngotsErrorState(l.message));
    }, (r) {
      ingotsModel = r;

      emit(HomeIngotsSuccessState(
        r,
      ));
    });
  }

  String getCurrencyCode(String originalText) {
    // Splitting the original text by '/'
    List<String> parts = originalText.split('/');

    // Getting the last part of the split text (which should be 'USD' in this case)
    String currencyCode = parts.last;

    return currencyCode;
  }

  getChartData(
    int id,
  ) async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getChartData(
        selectedCoin?.id ?? 19,
        "live",
        DateTime.tryParse(
                '${startDate?.year}-${startDate?.month}-${startDate?.day}') ??
            DateTime.now().subtract(const Duration(days: 3)));

    result.fold((l) {
      emit(HomeLiveErrorState(l.message));
    }, (r) {
      chartModel = r;
      currencyId = r.livePrices?.currcenyId;
      print(currencyId?[1].date);
      print(currencyId?[1].price);
      emit(HomeLiveSuccessState(r));
    });
  }

  getChartDataForBlack(
    int id,
  ) async {
    print("startDate $startDate");
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getChartData(selectedCoin?.id ?? 19,
        "black", startDate ?? DateTime.now().subtract(const Duration(days: 1)));
    result.fold((l) {
      emit(HomeLiveErrorState(l.message));
    }, (r) {
      chartModel = r;
      currencyIdBlack = r.blackprices?.currcenyIdBlack;
      print("startDate $startDate");

      print(currencyIdBlack?[1].price);
      print(currencyIdBlack?[1].date);

      emit(HomeLiveSuccessState(r));
    });
  }

  clacAvgBuyPrice() {
    var result = selectedCoin?.bankPrices
        ?.map((e) => e.buyPrice)
        .reduce((a, b) => a! + b!);

    if (result == null) {
      return;
    }
    var avg = result / (selectedCoin?.bankPrices?.length ?? 0);
    return avg.toStringAsFixed(2);
  }

  clacAvgSellPrice() {
    var result = selectedCoin?.bankPrices
        ?.map((e) => e.sellPrice)
        .reduce((a, b) => a! + b!);
    if (result == null) {
      return;
    }
    var avg = result / (selectedCoin?.bankPrices?.length ?? 0);
    return avg.toStringAsFixed(2);
  }

  saveFavBank(BanksModel bankId, BankPrice bankPrice, CoinsModel coinId) {
    emit(HomeSaveFavLoadingState());
    SaveBankFavorite.saveFavorite(bankId);
    SaveBankPriceFavorite.saveFavorite(bankPrice);
    SaveCoinIdFavorite.saveFavorite(
      coinId,
    );
    favoriteCoinIds.add(coinId.id!);

    emit(HomeSaveFavSuccessState());
  }

  deleteBank(BanksModel? banksModel) {
    emit(HomeSaveFavLoadingState());

    SaveBankFavorite.favoriteBox.delete(banksModel?.id);
    favoriteBankIds.remove(banksModel?.id);
    favBank.removeWhere((element) => element.e == banksModel);
    // loadedFavItems.add(BankFavItemWidget(e: bankId, j: coinId, i: bankPrice));

    emit(HomeDeleteFavSuccessState());
  }
}
