import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldTabWidget extends StatelessWidget {
  GoldTabWidget({
    super.key,
    required this.isSelected,
    required this.txt,
  });
  String txt;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94.w,
      height: 44.h,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffFEDC00) : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: isSelected ? 16.sp : 14.sp,
            fontWeight: FontWeight.w700,
            color:
                isSelected ? const Color(0xff0E0E0E) : const Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
