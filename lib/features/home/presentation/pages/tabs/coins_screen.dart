import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/chart_widget.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/grid_view_widget.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/head_of_coins_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        } else if (state is HomeCurrcinesSuccessState) {}
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return SafeArea(
          child: ListView(
            physics: const PageScrollPhysics(),
            children: [
              const HeadOfCoinsScreen(),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 303.5.h,
                child: const LineChartSample2(),
              ),
              const GridViewWidget(),
            ],
          ),
        );
      },
    );
  }
}
