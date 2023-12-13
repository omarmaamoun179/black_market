import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: icon ??
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.sp,
                  ),
            ),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
