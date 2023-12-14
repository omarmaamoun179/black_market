import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarningMessage extends StatelessWidget {
  WarningMessage({super.key, required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 69.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xff2a2a2a),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: const Color(0xffF2C94C),
              size: 24.sp,
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xffFFFAD9),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
