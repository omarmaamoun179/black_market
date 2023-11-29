import 'package:black_market/features/bank_details/presentation/widgets/item_of_clac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculaterWidget extends StatelessWidget {
  
  const CalculaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemOfCalculator(
                width: 80.w,
                height: 28.h,
                color: const Color(0xffFEDC00),
                borderRadius: BorderRadius.circular(7.r),
                text: 'الحاسبة',
                sizedBox: 2.w,
                widget: const Icon(
                  Icons.calculate,
                  color: Color(0xff3862E0),
                ),
              ),
              SizedBox(
                width: 70.w,
              ),
              ItemOfCalculator(
                width: 58.w,
                height: 18.h,
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(4.r),
                text: 'USD',
                sizedBox: 2.w,
              ),
              ImageIcon(
                const AssetImage(
                  'assets/images/dollar_circle.png',
                ),
                color: const Color(0xffFEDC00),
                size: 17.sp,
              ),
              ItemOfCalculator(
                width: 58.w,
                height: 18.h,
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(4.r),
                text: 'EGP',
                sizedBox: 2.w,
              ),
            ],
          ),
        ),
    
        Container(
          width: 147.w,
          height: 26.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: TextField(
            cursorHeight: 25.h,
            textAlign: TextAlign.start,
            cursorColor: const Color(0xffFEDC00),
            maxLines: 1,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffE7D2D2),
            ),
            decoration: InputDecoration(
              suffixIcon: Container(
                alignment: Alignment.bottomLeft,
                width: 37.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: const Color(0xffFEDC00),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Center(
                  child: Text(
                    'إحسب',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0E0E0E),
                    ),
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff968787),
                ),
                borderRadius: BorderRadius.circular(7.r),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff968787),
                ),
                borderRadius: BorderRadius.circular(7.r),
              ),
              hintText: 'أدخل القيمة',
              hintStyle: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xffE7D2D2),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            ItemOfCalculator(
              width: 101.w,
              height: 22.h,
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              text: '1 دولار أمريكي',
              sizedBox: 2.w,
            ),
            const ImageIcon(
              AssetImage(
                'assets/images/subway_equal.png',
              ),
              color: Color(0xffFEDC00),
            ),
            ItemOfCalculator(
              width: 101.w,
              height: 22.h,
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              text: '30.9 جنيه مصري',
              sizedBox: 2.w,
            ),
          ],
        ),
        //
      ],
    );
  }
}

