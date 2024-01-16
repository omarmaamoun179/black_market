import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/chart_widget.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/chart_widget_blackm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarChatWidget extends StatefulWidget {
  const TabBarChatWidget({super.key});

  @override
  State<TabBarChatWidget> createState() => _TabBarChatWidgetState();
}

class _TabBarChatWidgetState extends State<TabBarChatWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TabController tabController2;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // Check if the Ticker is active before disposing of it
    tabController.dispose();
    tabController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is HomeLoadingState
            ? SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Center(
                  child: Text(
                    '......جاري التحميل',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            : DefaultTabController(
                initialIndex: 0,
                length: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: const Color(0xffFEDC00),
                      ),
                      child: TabBar(
                        onTap: (index) {
                          tabController.index = index;
                          setState(() {});
                        },
                        controller: tabController,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        dividerColor: Colors.transparent,
                        indicatorColor: const Color.fromRGBO(254, 220, 0, 1),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xffFEDC00),
                        ),
                        unselectedLabelColor: const Color(0xffFFFFFF),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        tabs: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: tabController.index == 0
                                  ? const Color(0xff0E0E0E)
                                  : Colors.transparent,
                            ),
                            child: Tab(
                              child: Text(
                                "سعر السوق السوداء".tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tabController.index == 0
                                      ? const Color(0xffFEDC00)
                                      : const Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: tabController.index == 1
                                  ? const Color(0xff0E0E0E)
                                  : Colors.transparent,
                            ),
                            child: Tab(
                              child: Text(
                                'سعر البنك'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tabController.index == 1
                                      ? const Color(0xffFEDC00)
                                      : const Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 240.5.h,
                      child: TabBarView(
                        children: [
                          if (tabController.index == 0 &&
                              tabController2.index == 0)
                            const LineChartSample1(),
                          if (tabController.index == 0 &&
                              tabController2.index == 1)
                            const LineChartSample1(),
                          if (tabController.index == 0 &&
                              tabController2.index == 2)
                            const LineChartSample1(),
                          if (tabController.index == 1 &&
                              tabController2.index == 0)
                            const LineChartSample2(),
                          if (tabController.index == 1 &&
                              tabController2.index == 1)
                            const LineChartSample2(),
                          if (tabController.index == 1 &&
                              tabController2.index == 2)
                            const LineChartSample2(),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: const Color(0xffFEDC00),
                      ),
                      child: TabBar(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        dividerColor: Colors.transparent,
                        indicatorColor: const Color.fromRGBO(254, 220, 0, 1),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xffFEDC00),
                        ),
                        unselectedLabelColor: const Color(0xffFFFFFF),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        onTap: (index) {
                          tabController2.index = index;

                          if (tabController.index == 0 &&
                              tabController2.index == 0) {
                            cubit.startDate = DateTime.now();
                            cubit.getChartDataForBlack(
                                cubit.selectedCoin?.id ?? 19);
                          } else if (tabController.index == 0 &&
                              tabController2.index == 1) {
                            cubit.startDate = DateTime.now()
                                .subtract(const Duration(days: 4));
                            cubit.getChartDataForBlack(
                                cubit.selectedCoin?.id ?? 19);

                            print(cubit.startDate);
                          } else if (tabController.index == 0 &&
                              tabController2.index == 2) {
                            cubit.startDate = DateTime.now()
                                .subtract(const Duration(days: 365));
                            cubit.getChartDataForBlack(
                                cubit.selectedCoin?.id ?? 19);
                          } else if (tabController.index == 1 &&
                              tabController2.index == 0) {
                            cubit.startDate = DateTime.now();
                            cubit.getChartData(cubit.selectedCoin?.id ?? 19);
                          } else if (tabController.index == 1 &&
                              tabController2.index == 1) {
                            cubit.startDate = DateTime.now()
                                .subtract(const Duration(days: 4));
                            cubit.getChartData(cubit.selectedCoin?.id ?? 19);
                          } else if (tabController.index == 1 &&
                              tabController2.index == 2) {
                            cubit.startDate = DateTime.now()
                                .subtract(const Duration(days: 365));
                            cubit.getChartData(cubit.selectedCoin?.id ?? 19);
                          }
                        },
                        tabs: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: tabController2.index == 0
                                  ? const Color(0xff0E0E0E)
                                  : Colors.transparent,
                            ),
                            child: Tab(
                              child: Text(
                                'يوم'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tabController2.index == 0
                                      ? const Color(0xffFEDC00)
                                      : const Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: tabController2.index == 1
                                  ? const Color(0xff0E0E0E)
                                  : Colors.transparent,
                            ),
                            child: Tab(
                              child: Text(
                                'شهر'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tabController2.index == 1
                                      ? const Color(0xffFEDC00)
                                      : const Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: tabController2.index == 2
                                  ? const Color(0xff0E0E0E)
                                  : Colors.transparent,
                            ),
                            child: Tab(
                              child: Text(
                                'سنة'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tabController2.index == 2
                                      ? const Color(0xffFEDC00)
                                      : const Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: tabController2,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
