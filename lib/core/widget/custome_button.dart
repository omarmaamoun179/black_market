import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onPressed});
  String text;
  double width;
  double height;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          backgroundColor: const Color(0xffFEDC00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onPressed(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff0D0D0D),
          ),
        ),
      ),
    );
  }
}
