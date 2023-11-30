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
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(16.r),
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
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 117.w),
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
