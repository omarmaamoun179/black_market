import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/pages/tabs/coins.dart';
import 'package:black_market/features/home/presentation/pages/tabs/fav.dart';
import 'package:black_market/features/home/presentation/pages/tabs/golds.dart';
import 'package:black_market/features/home/presentation/pages/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const CoinsScreen(),
    const GoldsScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
}
