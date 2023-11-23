import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              CustomAppBar(
                title: 'إنشاء حساب جديد',
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
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 92.h,
                      ),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        keyBoardType: TextInputType.emailAddress,
                        lableText: 'أدخل الاسم بالكامل',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                        hasSuffixIcon: false,
                      ),
                      SizedBox(
                        height: 55.h,
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
                        height: 55.h,
                      ),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        keyBoardType: TextInputType.emailAddress,
                        lableText: ' أدخل كلمة المرور',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                        hasSuffixIcon: false,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        keyBoardType: TextInputType.emailAddress,
                        lableText: ' أدخل كلمة المرور',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                        hasSuffixIcon: false,
                      ),
                      SizedBox(height: 120.h),
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
                            ' التالي ',
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
            ],
          ),
        ),
      ),
    );
  }
}
