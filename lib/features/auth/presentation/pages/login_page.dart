import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogingScreen extends StatelessWidget {
  LogingScreen({super.key});
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomAppBar(
                  title: '',
                  icon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                'تسجيل الدخول\nالي حسابك ',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    // Text(
                    //   textDirection: TextDirection.rtl,
                    //   'البريد الالكتروني ',
                    //   style: TextStyle(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w700,
                    //       color: Colors.white),
                    // ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      keyBoardType: TextInputType.emailAddress,
                      lableText: 'أدخل الايميل الالكتروني',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(
                          0xffFFFFFF,
                        ),
                      ),
                      hasSuffixIcon: false,
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    // Text(
                    //   textDirection: TextDirection.rtl,
                    //   'كلمة المرور ',
                    //   style: TextStyle(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w700,
                    //       color: Colors.white),
                    // ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      keyBoardType: TextInputType.emailAddress,
                      lableText: 'أدخل كلمة المرور',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(
                          0xffFFFFFF,
                        ),
                      ),
                      hasSuffixIcon: false,
                    ),
                    Row(
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          'نسيت كلمة المرور؟ ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFFF4B0)),
                        ),
                        const Spacer(),
                        Expanded(
                          child: ListTile(
                            title: Radio(
                              fillColor: MaterialStateProperty.all(
                                  const Color(0xffFFF4B0)),
                              value: 0,
                              groupValue: 1,
                              onChanged: (value) {},
                            ),
                            leading: Text(
                              'تذكرني',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFF4B0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
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
                        onPressed: () {},
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0D0D0D),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          'إنشاء حساب ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFFF4B0)),
                        ),
                        Text(
                          textDirection: TextDirection.rtl,
                          'ليس لديك حساب؟ ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 134.w,
                          height: 2.h,
                          color: const Color(0xff2A2A2A),
                        ),
                        Text(
                          textDirection: TextDirection.rtl,
                          'أو ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff666666),
                          ),
                        ),
                        Container(
                          width: 134.w,
                          height: 2.h,
                          color: const Color(0xff2A2A2A),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/google.png',
                          width: 50.w,
                          height: 50.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
