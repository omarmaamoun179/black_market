import 'package:black_market/config/router/routes.dart';
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
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(327.w, 52.h),
                      backgroundColor: const Color(0xffFEDC00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.home, (route) => false);
                    },
                    child: Text(
                      ' الصفحة الرئيسية',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0D0D0D),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
