import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAppBar(
          title: 'إنشاء حساب جديد',
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
    );
  }
}
