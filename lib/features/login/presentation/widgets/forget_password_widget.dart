import 'package:black_market/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.foregetPassword);
          },
          child: Text(
            textDirection: TextDirection.rtl,
            'نسيت كلمة المرور؟ ',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFFF4B0)),
          ),
        ),
        const Spacer(),
        Expanded(
          child: ListTile(
            title: Radio(
              fillColor: MaterialStateProperty.all(const Color(0xffFFF4B0)),
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
    );
  }
}
