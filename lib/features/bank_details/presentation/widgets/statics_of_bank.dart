import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatictsOfBank extends StatelessWidget {
  StatictsOfBank(
      {super.key, this.coulmnText1, this.coulmnText2, this.coulmnText3});
  CoulmnText? coulmnText1;
  CoulmnText? coulmnText2;
  CoulmnText? coulmnText3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //هنا هيبقي في agrument صورة البنك واسمه
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 5.h),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/bank_misr.png',
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  ' البنك المركزي المصري ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              coulmnText1!,
              coulmnText2!,
              coulmnText3 ?? CoulmnText(),
            ],
          ),
        ],
      ),
    );
  }
}
