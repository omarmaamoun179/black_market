import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:black_market/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:black_market/features/auth/presentation/widgets/otp_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    super.key,
    this.email,
  });
  String? email;

  // TextEditingController otpC = TextEditingController();
  // TextEditingController pass = TextEditingController();
  // TextEditingController passConfirm = TextEditingController();
  // TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UpdatePassSuccess) {
          Navigator.pushNamed(context, Routes.finish);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('success'),
            ),
          );
        } else if (state is UpdatePassError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
          print(state.error.toString());
        } else if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('تم إرسال رمز التحقق بنجاح'),
          ));
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
          print(state.error.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
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
                    email!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xffFEDC00),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  OtpBoxWidget(
                    otpController: AuthCubit.get(context).otpController,
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " لم تتلق الرمز",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffE0E0E0),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      OtpTimerButton(
                          buttonType: ButtonType.outlined_button,
                          backgroundColor:
                              const Color(0xffFFFFFF).withOpacity(.17),
                          loadingIndicator: const CircularProgressIndicator(
                            color: Color(0xffFEDC00),
                          ),
                          onPressed: () {
                            AuthCubit.get(context).forgetPassword(
                              email!,
                            );
                          },
                          text: Text(
                            " إعادة إرسال الرمز ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xffFEDC00),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          duration: 40),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    controller: AuthCubit.get(context).passwordController,
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
                    controller:
                        AuthCubit.get(context).confirmPasswordController,
                    lableText: 'أعد إدخال كلمة المرور الجديدة',
                    suffixIcon: const Icon(
                      Icons.lock_outlined,
                      color: Color(
                        0xffFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 140.h,
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
                        print("email: $email");
                        print(
                            "otp: ${AuthCubit.get(context).otpController.text}");
                        print(
                            "pass: ${AuthCubit.get(context).passwordController.text} confrimPass: ${AuthCubit.get(context).confirmPasswordController.text}}"
                                .toString());

                        AuthCubit.get(context).updatePassword(email!);
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
