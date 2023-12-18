import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profileItemWidget extends StatelessWidget {
  profileItemWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  IconData? icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xffFAFAFA),
              size: 24.sp,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFAFAFA),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xffFAFAFA),
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
