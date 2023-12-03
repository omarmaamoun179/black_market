import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:black_market/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamed(context, Routes.otp,
              arguments: AuthCubit.get(context).emailController.text);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إرسال رمز التحقق بنجاح'),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('invalid email'),
            ),
          );
          print(state.error);
        }
      },
      builder: (context, state) {
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
                  Container(
                    width: 327.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color(0xff2a2a2a),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: Text(
                              'سيتم إرسال رمز التحقق إلى البريد الإلكتروني المسجل لديك',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffFFFAD9),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  CustomTextFormField(
                    textInputAction: TextInputAction.done,
                    controller: AuthCubit.get(context).emailController,
                    keyBoardType: TextInputType.emailAddress,
                    lableText: 'أدخل البريد الالكتروني',
                    suffixIcon: const Icon(
                      Icons.email,
                      color: Color(
                        0xffFFFFFF,
                      ),
                    ),
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
                        AuthCubit.get(context).forgetPassword();
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
      },
    );
  }
}
