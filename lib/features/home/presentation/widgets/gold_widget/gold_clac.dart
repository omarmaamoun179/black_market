import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xff2A2A2A),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 64.h,
          ),
          SizedBox(
            width: 291.w,
            height: 32.h,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'السعر الحالي للذهب',
                hintStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff968787),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff968787), width: .5.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff968787), width: .5.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 138.w,
                height: 32.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'الوزن بالجرام',
                    hintStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff968787),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 138.w,
                height: 32.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: ' العيار ',
                    hintStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff968787),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.w,
          ),
          Container(
            margin: EdgeInsets.only(
                left: 62.w, right: 62.w, bottom: 18.h, top: 24.h),
            width: 167.w,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: const Color(0xffFFC907),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'حساب مصنعية الذهب',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff0D0D0D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
