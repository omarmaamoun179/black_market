import 'package:black_market/features/bank_details/presentation/widgets/bank_details_appbar.dart';
import 'package:black_market/features/bank_details/presentation/widgets/calc_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/info_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/statics_of_bank.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BankDetailsAppBar(),
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 70.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    height: 85.h,
                    width: 327.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFEDC00),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        //هنا هيبقي في agrument صورة البنك واسمه
                        Text(
                          ' دولار أمريكي /Usd ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff4F4F4F),
                          ),
                        ),

                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CoulmnText(
                                text: 'شراء',
                                text2: '30.65',
                                color1: const Color(0xff362727),
                                color2: const Color(0xff0E0E0E),
                              ),
                              VerticalDivider(
                                color: const Color(0xff4F4F4F),
                                indent: 12.5.h,
                                width: 25.w,
                              ),
                              CoulmnText(
                                text: 'بيع',
                                text2: '35',
                                color1: const Color(0xff362727),
                                color2: const Color(0xff0E0E0E),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                    child: const CalculaterWidget(),
                  ),
                  SizedBox(height: 18.h),
                  Container(
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
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                  ),
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
                  const InfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
