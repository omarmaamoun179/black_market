import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/chart_widget_blackm.dart';
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
        return DefaultTabController(
          initialIndex: 0,
          length: 1,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
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
                          'سعر سوق السوداء',
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
                          'سعر البنك ',
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
                    if (tabController.index == 0 && tabController2.index == 0)
                      const LineChartSample1(),
                    // Center(
                    //   child: Text(
                    //     'data of tabBarone index 0 and tabBarTwo index 0',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 25.sp,
                    //     ),
                    //   ),
                    // ),
                    if (tabController.index == 0 && tabController2.index == 1)
                      const LineChartSample1(),

                    if (tabController.index == 0 && tabController2.index == 2)
                      const LineChartSample1(),
                    // Center(
                    //   child: Text(
                    //     'data of tabBarone index 0 and tabBarTwo index 2',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 25.sp,
                    //     ),
                    //   ),
                    // ),
                    if (tabController.index == 1 && tabController2.index == 0)
                      Center(
                        child: Text(
                          'data of tabBarone index 1 and tabBarTwo index 0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    if (tabController.index == 1 && tabController2.index == 1)
                      Center(
                        child: Text(
                          'data of tabBarone index 1 and tabBarTwo index 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    if (tabController.index == 1 && tabController2.index == 2)
                      Center(
                        child: Text(
                          'data of tabBarone index 1 and tabBarTwo index 2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              TabBar(
                onTap: (index) {
                  tabController2.index = index;

                  if (tabController2.index == 0) {
                    cubit.startDate = DateTime.now();
                    cubit.getChartDataForBlack(cubit.selectedCoin?.id ?? 19);
                  } else if (tabController2.index == 1) {
                    cubit.startDate =
                        DateTime.now().subtract(const Duration(days: 4));
                    cubit.getChartDataForBlack(cubit.selectedCoin?.id ?? 19);

                    print(cubit.startDate);
                  } else if (tabController2.index == 2) {
                    cubit.startDate =
                        DateTime.now().subtract(const Duration(days: 365));
                
                  }

                  setState(() {});
                },
                tabs: const [
                  Tab(
                    text: 'يوم',
                  ),
                  Tab(
                    text: 'شهر',
                  ),
                  Tab(
                    text: 'سنة',
                  ),
                ],
                controller: tabController2,
              ),
            ],
          ),
        );
      },
    );
  }
}
