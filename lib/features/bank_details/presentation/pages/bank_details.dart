import 'package:black_market/features/bank_details/presentation/widgets/bank_details_appbar.dart';
import 'package:black_market/features/bank_details/presentation/widgets/calc_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/currucines_in_bank.dart';
import 'package:black_market/features/bank_details/presentation/widgets/info_widget.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  BankDetails({
    super.key,
    this.banksModel,
  });
  BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesSuccessState) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                BankDetailsAppBar(
                  banksModel: banksModel!,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        height: 100.h,
                        width: 327.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFEDC00),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: CurrciensInBank(banksModel: banksModel),
                      ),
                      SizedBox(height: 18.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        width: 327.w,
                        height: 121.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff2A2A2A),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: CalculaterWidget(
                          banksModel: banksModel,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      const HeadOfInfoWidget(),
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        decoration: const BoxDecoration(
                          color: Color(0xff2A2A2A),
                        ),
                        child: Divider(
                          color: const Color(0xff967373),
                          indent: 28.w,
                          endIndent: 28.w,
                        ),
                      ),
                      InfoWidget(
                        banksModel: banksModel!,
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

class HeadOfInfoWidget extends StatelessWidget {
  const HeadOfInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      width: 327.w,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'العمله',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFFFFFF),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              'شراء',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFFFFFF),
              ),
            ),
            Text(
              'بيع',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
