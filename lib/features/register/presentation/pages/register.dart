import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/core/widget/custom_text_field.dart';
import 'package:black_market/features/login/presentation/pages/login_page.dart';
import 'package:black_market/features/register/presentation/cubit/register_cubit.dart';
import 'package:black_market/features/register/presentation/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          RegisterCubit.get(context).register();
          Navigator.pushNamed(context, Routes.home);
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message.toString()),
            ),
          );
          print(state.message.toString());
        }
      },
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color(0xff0D0D0D),
            body: SafeArea(
              bottom: false,
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 92.h,
                              ),
                              CustomTextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Your Name';
                                  } else if (RegExp(
                                          r'[!@#<>?":_`~;[\]\|=+\-)(*&^%1234567890]')
                                      .hasMatch(value)) {
                                    return 'Enter a Valid Name';
                                  } else {
                                    return null; // No validation error
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller:
                                    RegisterCubit.get(context).nameController,
                                keyBoardType: TextInputType.text,
                                lableText: 'أدخل الاسم بالكامل',
                                suffixIcon: const Icon(
                                  Icons.person,
                                  color: Color(
                                    0xffFFFFFF,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 55.h,
                              ),
                              CustomTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your email';
                                  } else if (!value.isValidEmail()) {
                                    return 'invalid email';
                                  }

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                controller:
                                    RegisterCubit.get(context).emailController,
                                keyBoardType: TextInputType.emailAddress,
                                lableText: 'أدخل الايميل الالكتروني',
                                suffixIcon: const Icon(
                                  Icons.email,
                                  color: Color(
                                    0xffFFFFFF,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 55.h,
                              ),
                              CustomTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your password';
                                  } else if (!value.isValidPassword()) {
                                    return 'invalid password';
                                  }

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                controller: RegisterCubit.get(context)
                                    .passwordController,
                                keyBoardType: TextInputType.text,
                                obscureText:
                                    RegisterCubit.get(context).isObsecure,
                                lableText: ' أدخل كلمة المرور',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changeVisibility();
                                  },
                                  icon: RegisterCubit.get(context).suffixIcon,
                                ),
                              ),
                              SizedBox(
                                height: 55.h,
                              ),
                              CustomTextFormField(
                                validator: (value) {
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return 'passwords do not match';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                controller: RegisterCubit.get(context)
                                    .confirmPasswordController,
                                keyBoardType: TextInputType.text,
                                obscureText:
                                    RegisterCubit.get(context).isObsecure,
                                lableText: ' تأكيد كلمة المرور',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changeVisibility();
                                  },
                                  icon: RegisterCubit.get(context).suffixIcon,
                                ),
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
                                  onPressed: () {
                                    if (RegisterCubit.get(context)
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      RegisterCubit.get(context).register();
                                    }
                                  },
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
