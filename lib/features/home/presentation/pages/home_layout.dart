import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          
          backgroundColor: const Color(0xff0D0D0D),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            child: CustomBottomNavigationBar(
              currentIndex: HomeCubit.get(context).currentIndex,
              onTap: (index) => HomeCubit.get(context).changeBottomNav(index),
            ),
          ),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).currentIndex],
        );
      },
    );
  }
}
