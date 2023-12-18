import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:black_market/features/login/presentation/cubit/login_cubit.dart';
import 'package:black_market/features/login/presentation/cubit/login_state.dart';
import 'package:black_market/features/login/presentation/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class LogingScreen extends StatelessWidget {
  const LogingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          var box = Hive.openBox<String>('user');
          box.then((value) {
            value.put(Constant.accessToken, state.loginModel.accessToken!);
          });

          Navigator.pushNamed(context, Routes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('success'),
            ),
          );
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('invalid email or password'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formKey,
          child: Scaffold(
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
                        icon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                        title: '',
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
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomTextFormField(
                            suffixIcon: const Icon(
                              Icons.email,
                              color: Color(0xffFFFFFF),
                            ),
                            keyBoardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (!value.isValidEmail()) {
                                return 'invalid email';
                              }

                              return null;
                            },
                            controller: LoginCubit.get(context).emailController,
                            lableText: 'البريد الالكتروني',
                          ),
                          SizedBox(
                            height: 52.h,
                          ),
                          CustomTextFormField(
                            suffixIcon: IconButton(
                              onPressed:
                                  LoginCubit.get(context).changeVisibility,
                              icon: Icon(
                                LoginCubit.get(context).isVisible
                                    ? Icons.lock_outline
                                    : Icons.lock_open_outlined,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            keyBoardType: TextInputType.text,
                            obscureText: LoginCubit.get(context).isVisible,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              } else if (!value.isValidPassword()) {
                                return 'invalid password';
                              }

                              return null;
                            },
                            controller:
                                LoginCubit.get(context).passwordController,
                            lableText: 'البريد الالكتروني',
                          ),
                          const ForgetPasswordWidget(),
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
                              onPressed: () {
                                if (LoginCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  LoginCubit.get(context).login();
                                }
                              },
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
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.register);
                                },
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  'إنشاء حساب ',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xffFFF4B0)),
                                ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[!@#$%^&*()_+{}|:"<>?[\];\,./])(?=.*?[0-9]).{8,}$')
        .hasMatch(this);
  }
}
