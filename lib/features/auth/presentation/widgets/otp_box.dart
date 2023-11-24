import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpBoxWidget extends StatelessWidget {
  OtpBoxWidget({super.key, this.color});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: .5.w,
          color: const Color(0xffFEDC00),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffD3DCEE),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color!,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: .5.w,
              color: const Color(0xffE3E3E3),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: InputBorder.none,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
