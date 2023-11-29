import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankWidgetGridView extends StatelessWidget {
  const BankWidgetGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 156.w,
      height: 134.3.h,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(7.7.r),
        border: Border.all(
          width: .5.w,
          color: const Color(0xff4F4F4F),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 25.5.w,
                height: 25.5.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: .78.w,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 12.sp,
                  color: const Color(0xffF1F0FA),
                ),
              ),
              Image.asset(
                'assets/images/bank_misr.png',
                width: 46.6.w,
                height: 46.6.h,
              ),
              Container(
                width: 25.5.w,
                height: 25.5.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: .78.w,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                child: Icon(
                  Icons.share,
                  size: 12.sp,
                  color: const Color(0xffF1F0FA),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'بنك مصر',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xffFFFFFF),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CoulmnText(
                  text: 'شراء',
                  text2: '30.65',
                  style2: TextStyle(
                    color: const Color(0xffffffff),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                VerticalDivider(
                  color: const Color(0xff4F4F4F),
                  indent: 18.h,
                  width: 18.w,
                ),
                CoulmnText(
                  color1: const Color(0xffffffff),
                  text: 'بيع',
                  text2: '35',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
