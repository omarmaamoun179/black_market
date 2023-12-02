import 'package:black_market/features/bank_details/presentation/widgets/statics_of_bank.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetailsAppBar extends StatelessWidget {
  const BankDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
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
              Container(
                margin: EdgeInsets.only(bottom: 230.h),
                decoration: BoxDecoration(
                  color: const Color(0xff0E0E0E).withOpacity(.4),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
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
            top: 230.h,
            child: StatictsOfBank(
              coulmnText1: CoulmnText(
                text: 'البنك',
                text2: '30.65',
                color2: const Color(0xff4F4F4F),
              ),
              coulmnText2: CoulmnText(
                text: 'أخر تحديث',
                text2: 'منذ 15 دقيقة',
                color2: const Color(0xff4F4F4F),
              ),
              coulmnText3: CoulmnText(
                text: 'السوق السوداء',
                text2: '50.65',
                color2: const Color(0xffBFA500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
