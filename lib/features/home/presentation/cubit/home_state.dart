import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/chart_model/chart_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/compnies_model/compnies_model.dart';
import 'package:black_market/features/home/data/models/golds_model/golds_model.dart';
import 'package:black_market/features/home/data/models/ingots_model/ingots_model.dart';
import 'package:black_market/features/home/data/models/profiel_model/profiel_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeCurrencyLoadingState extends HomeState {}

class HomeChangeBottomNavState extends HomeState {}

class HomeCurrcinesSuccessState extends HomeState {
  List<CoinsModel> coinsModel;

  HomeCurrcinesSuccessState(
    this.coinsModel,
  );
}

class HomeCurrcinesErrorState extends HomeState {
  final String error;
  HomeCurrcinesErrorState(this.error);
}

class HomeBankLoadingState extends HomeState {}

class HomeBanksSuccessState extends HomeState {
  List<BanksModel> banksModel;

  HomeBanksSuccessState(this.banksModel);
}

class HomeBanksErrorState extends HomeState {
  final String error;
  HomeBanksErrorState(this.error);
}

class HomeStackWidgetSuccessState extends HomeState {
  CoinsModel? selectedModel;
  HomeStackWidgetSuccessState(this.selectedModel);
}

class HomeStackWidgetErrorState extends HomeState {
  final String error;
  HomeStackWidgetErrorState(this.error);
}

class HomeChangeTabState extends HomeState {}

class HomeGoldsSuccessState extends HomeState {
  List<GoldsModel> goldsModel;

  HomeGoldsSuccessState(this.goldsModel);
}

class HomeGoldsErrorState extends HomeState {
  final String error;
  HomeGoldsErrorState(this.error);
}

class HomeCompaniesSuccessState extends HomeState {
  List<CompniesModel> compniesModel;

  HomeCompaniesSuccessState(this.compniesModel);
}

class HomeCompaniesErrorState extends HomeState {
  final String error;
  HomeCompaniesErrorState(this.error);
}

class HomeIngotsSuccessState extends HomeState {
  IngotsModel ingotsModel;

  HomeIngotsSuccessState(
    this.ingotsModel,
  );
}

class HomeIngotsErrorState extends HomeState {
  final String error;
  HomeIngotsErrorState(this.error);
}

class HomeUpdateCompniesState extends HomeState {
  CompniesModel selectedCompnies;
  HomeUpdateCompniesState(
    this.selectedCompnies,
  );
}

class HomeLiveSuccessState extends HomeState {
  ChartModel? chartModel;

  HomeLiveSuccessState(
    this.chartModel,
  );
}

class HomeLiveErrorState extends HomeState {
  final String error;
  HomeLiveErrorState(this.error);
}

class HomeUpdateBankState extends HomeState {
  List<BanksModel>? selectedBank;
  HomeUpdateBankState(
    this.selectedBank,
  );
}

class HomeSaveFavLoadingState extends HomeState {}

class HomeDeleteFavSuccessState extends HomeState {}

class HomeSaveFavSuccessState extends HomeState {}

class HomeSaveFavErrorState extends HomeState {
  String error;
  HomeSaveFavErrorState(this.error);
}

class HomeRemoveFavSuccess extends HomeState {}

class HomeProfileSuccessStat extends HomeState {
  ProfileModel? profileModel;
  HomeProfileSuccessStat(this.profileModel);
}

class HomeProfileErrorState extends HomeState {
  String error;
  HomeProfileErrorState(this.error);
}
