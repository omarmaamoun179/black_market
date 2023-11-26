import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPassword extends StatelessWidget {
  ConfirmPassword({super.key});
  var passwordController = TextEditingController();
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
                title: 'إسترجاع كلمة المرور',
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
                        controller: passwordController,
                        lableText: 'أدخل كلمة المرور الجديدة',
                        suffixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        controller: confirmPasswordController,
                        lableText: 'أعد إدخال كلمة المرور الجديدة',
                        suffixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.finish, (route) => false);
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
