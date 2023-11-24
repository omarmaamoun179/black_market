import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff0D0D0D),
        image: DecorationImage(
          image: AssetImage('assets/images/finish.png'),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250.h,
                ),
                Text(
                  'تم إنشاء كلمة مرور جديدة بنجاح',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: const Color(0xffFEDC00),
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
