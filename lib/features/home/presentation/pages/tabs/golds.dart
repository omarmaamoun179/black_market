import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/first_tab_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/gold_app_bar_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/sec_tab_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/tab_bar_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/third_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldsScreen extends StatelessWidget {
  const GoldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: DefaultTabController(
            length: cubit.tabs.length,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const GoldsAapBar(),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 327.w,
                        height: 62.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xff2A2A2A),
                        ),
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide.none),
                          onTap: (index) {
                            cubit.changeTab(index);
                          },
                          tabs: cubit.tabs
                              .map(
                                (e) => GoldTabWidget(
                                  isSelected: cubit.selectedIndex ==
                                      cubit.tabs.indexOf(e),
                                  txt: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const Expanded(
                        child: TabBarView(
                          // controller: tabController,
                          children: [
                            GoldFirstTabWidget(),
                            GoldSecTabWidget(),
                            GoldThirdTabWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
