import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/grid_view_widget.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/head_of_coins_screen.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/tabbar_chart_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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
              content: Text(state.error.toString()),
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
              // Container(
              //   margin:
              //       EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              //   width: 50.w,
              //   height: 50.h,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.r),
              //     color: const Color(0xffFEDC00),
              //   ),
              //   child: TabBar(
              //       onTap: (index) {
              //         cubit.changeTab(index);
              //       },
              //       padding: EdgeInsets.symmetric(vertical: 8.h),
              //       dividerColor: Colors.transparent,
              //       indicatorColor: const Color.fromRGBO(254, 220, 0, 1),
              //       indicator: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16.r),
              //         color: const Color(0xffFEDC00),
              //       ),
              //       unselectedLabelColor: const Color(0xffFFFFFF),
              //       unselectedLabelStyle: TextStyle(
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.w700,
              //         color: const Color(0xff0E0E0E),
              //       ),
              //       labelStyle: TextStyle(
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w700,
              //         color: const Color(0xff0E0E0E),
              //       ),
              //       tabs: [
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 15.w),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(16.r),
              //             color: cubit.selectedIndex == 0
              //                 ? const Color(0xff0E0E0E)
              //                 : Colors.transparent,
              //           ),
              //           child: Tab(
              //             child: Text(
              //               "سعر السوق السوداء".tr(),
              //               style: TextStyle(
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w700,
              //                 color: cubit.selectedIndex == 0
              //                     ? const Color(0xffFEDC00)
              //                     : const Color(0xff0E0E0E),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 15.w),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(16.r),
              //             color: cubit.selectedIndex == 1
              //                 ? const Color(0xff0E0E0E)
              //                 : Colors.transparent,
              //           ),
              //           child: Tab(
              //             child: Text(
              //               'سعر البنك'.tr(),
              //               style: TextStyle(
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w700,
              //                 color: cubit.selectedIndex == 1
              //                     ? const Color(0xffFEDC00)
              //                     : const Color(0xff0E0E0E),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ]),
              // ),
              // SizedBox(
              //   height: 240.5.h,
              //   child:  TabBarView(children: [
              //     LineChartSample1(),
              //     LineChartSample2(),
              //   ]),
              // ),
              // DefaultTabController(
              //   length: 2,
              //   child: TabBar(tabs: [
              //     Tab(
              //       text: 'يوم'.tr(),
              //     ),
              //     Tab(
              //       text: 'شهر'.tr(),
              //     ),
              //   ]),
              // ),
              const TabBarChatWidget(),
              SizedBox(
                height: 25.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: 327.w,
                height: 65.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xffFEDC00),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "متوسط السعر".tr(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff333333),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CoulmnText(
                          text: 'شراء'.tr(),
                          style1: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff362727),
                          ),
                          text2: '${cubit.clacAvgBuyPrice() ?? 0}' ?? '0',
                          style2: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0E0E0E),
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CoulmnText(
                          text: 'بيع'.tr(),
                          style1: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff362727),
                          ),
                          text2: '${cubit.clacAvgSellPrice() ?? 0}' ?? '',
                          style2: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0E0E0E),
                          ),
                        ),
                      ),
                      const Icon(Icons.calculate_rounded,
                          color: Color(0xff3862E0))
                    ],
                  ),
                ),
              ),
              const GridViewWidget(),
            ],
          ),
        );
      },
    );
  }
}
