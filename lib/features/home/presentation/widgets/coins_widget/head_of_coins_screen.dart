import 'package:black_market/config/router/routes.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadOfCoinsScreen extends StatelessWidget {
  const HeadOfCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Container(
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
                    margin: EdgeInsets.only(bottom: 270.h),
                    decoration: BoxDecoration(
                      color: const Color(0xff0E0E0E).withOpacity(.4),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.notification);
                        },
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
                child: StackWidget(
                  blackMarketPrice:
                      cubit.selectedCoin?.blackMarketPrices?.isEmpty ?? true
                          ? null
                          : cubit.selectedCoin?.blackMarketPrices?[0],
                  livePrice: cubit.selectedCoin?.livePrices?.isEmpty ?? true
                      ? null
                      : cubit.selectedCoin?.livePrices?[0],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
