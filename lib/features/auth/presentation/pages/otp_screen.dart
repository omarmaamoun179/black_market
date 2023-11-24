import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/features/auth/presentation/widgets/otp_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              CustomAppBar(
                title: 'إستعادة كلمة المرور',
                icon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text("قم بإدخال الكود المرسل",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  )),
              Text(
                'لقد قمنا بإرسال رمز التأكيد الى ',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xffFFFAD9),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'omarmaamoun@gmail.com',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xffFEDC00),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpBoxWidget(
                    color: const Color(0xff2A2A2A),
                  ),
                  OtpBoxWidget(
                    color: const Color(0xff2A2A2A),
                  ),
                  OtpBoxWidget(
                    color: const Color(0xff2A2A2A),
                  ),
                  OtpBoxWidget(
                    color: const Color(0xff2A2A2A),
                  ),
                ],
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(40 ثانية) إعادة إرسال الرمز",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xffFEDC00),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " لم تتلق الرمز",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE0E0E0),
                    ),
                  ),
                ],
              ),
              const Spacer(),
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
                    Navigator.pushNamed(context, Routes.otp);
                  },
                  child: Text(
                    ' إرسال ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0D0D0D),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
