import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/chart_widget.dart';
import 'package:black_market/features/home/presentation/widgets/grid_view_widget.dart';
import 'package:black_market/features/home/presentation/widgets/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsScreen extends StatelessWidget {
  CoinsScreen({super.key});
  CoinsModel? coinsModel;
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
        } else if (state is HomeCurrcinesSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Success'),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ListView(
            physics: const PageScrollPhysics(),
            children: [
              Container(
                height: 340.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xff1A1A1A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 38.r,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 48.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'مرحبا',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            Text(
                              'عمر مأمون',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          margin: EdgeInsets.only(bottom: 230.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff0E0E0E).withOpacity(.4),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      'Black<Market',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xffFEDC00)),
                    ),
                    Positioned(
                      bottom: 70.h,
                      child: Text(
                        ' بكام في السوق السوداء ؟',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFF4B0)),
                      ),
                    ),
                    Positioned(
                        top: 265.h,
                        child: SizedBox(
                          height: 92.h,
                          width: 327.w,
                          child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).coinsModel?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return StackWidget(
                                  coinsModel:
                                      HomeCubit.get(context).coinsModel?[index],
                                  blackMarketPrice: HomeCubit.get(context)
                                      .blackbankPrices?[index]
                                      .sellPrice,
                                  livePrice: HomeCubit.get(context)
                                      .livePrices?[index]
                                      .price,
                                );
                              }),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 303.5.h,
                child: const LineChartSample2(),
              ),
              DefaultTabController(
                length: 6,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  labelColor: const Color(0xffFEDC00),
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 24.w),
                  tabAlignment: TabAlignment.center,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelColor: const Color(0xffB1BCCD),
                  onTap: (index) {
                    HomeCubit.get(context).getHomeData();
                  },
                  indicator: const BoxDecoration(),
                  isScrollable: true,
                  tabs: const [
                    Text(
                      'سبت',
                    ),
                    Text('أحد'),
                    Text('إثنين'),
                    Text('ثلاثاء'),
                    Text('أربعاء'),
                    Text(
                      'خميس',
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: const PageScrollPhysics(),
                shrinkWrap: true,
                itemCount: HomeCubit.get(context).banksModel?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 7 / 8,
                  mainAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      HomeCubit.get(context).getBanksData();
                      // Navigator.pushNamed(context, Routes.bankDetails);
                    },
                    child: BankWidgetGridView(
                      banksModel: HomeCubit.get(context).banksModel?[index],
                      imagePath:
                          HomeCubit.get(context).banksModel?[index].icon ?? '',
                      icon: Icon(
                        Icons.favorite_border,
                        size: 12.sp,
                        color: const Color(0xffF1F0FA),
                      ),
                      text:
                          HomeCubit.get(context).banksModel?[index].name ?? '',
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
