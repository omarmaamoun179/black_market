import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoulmnText extends StatelessWidget {
  CoulmnText(
      {super.key,
      this.text,
      this.text2,
      this.style1,
      this.color1,
      this.color2,
      this.style2});
  String? text;
  String? text2;
  TextStyle? style1;
  TextStyle? style2;
  Color? color1;
  Color? color2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text ?? '',
          style: style1 ??
              TextStyle(
                fontSize: 10.sp,
                color: color1 ?? const Color(0xff828282),
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text2 ?? '',
          style: style2 ??
              TextStyle(
                fontSize: 10.sp,
                color: color2 ?? const Color(0xffFFFFFF),
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    );
  }
}
