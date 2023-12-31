import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/chart_model/chart_model.dart';
import 'package:black_market/features/home/data/models/chart_model/currency_id.dart';
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
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const CoinsScreen(),
    const GoldsScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  List<String> tabs = ['الذهب', 'السبائك', 'العملات'];
  int selectedIndex = 0;
  late TabController tabController;
  int textIndex = 0;
  bool isClicked = false;

  int currentIndex = 0;
  int index = 0;
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
      emit(HomeCurrcinesErrorState(l.toString()));
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
      emit(HomeBanksErrorState(l.message.toString()));
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

  getGoldData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getGoldsData();
    result.fold((l) {
      emit(HomeGoldsErrorState(l.message.toString()));
    }, (r) {
      goldsModel = r;
      emit(HomeGoldsSuccessState(r));
    });
  }

  getCompniesData() async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getCompaniesData();
    result.fold((l) {
      emit(HomeCompaniesErrorState(l.message.toString()));
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
      emit(HomeIngotsErrorState(l.message.toString()));
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

  getChartData(int id) async {
    emit(HomeLoadingState());
    var result = await homeBaseRepo.getChartData(selectedCoin?.id ?? 19);

    result.fold((l) {
      emit(HomeLiveErrorState(l.message.toString()));
    }, (r) {
      chartModel = r;
      currencyId = r.livePrices?.currcenyId;
      print(currencyId?[0].price);
      emit(HomeLiveSuccessState(r));
    });
  }
}
