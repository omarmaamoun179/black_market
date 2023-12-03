import 'package:black_market/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpBoxWidget extends StatelessWidget {
  OtpBoxWidget({super.key, required this.otpController});
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return PinCodeTextField(
          appContext: context,
          hintStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xffD3DCEE),
          ),
          autoFocus: true,
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xffD3DCEE),
          ),
          keyboardType: TextInputType.number,
          validator: (
            value,
          ) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          enableActiveFill: true,
          length: 4,
          controller: otpController,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            borderWidth: .5.w,
            shape: PinCodeFieldShape.box,
            activeBorderWidth: .5.w,
            activeFillColor: const Color(0xff2A2A2A),
            inactiveColor: const Color(0xffFEDC00),
            selectedColor: const Color(0xffFEDC00),
            activeColor: const Color(0xffFEDC00),
            inactiveFillColor: const Color(0xff2A2A2A),
            selectedFillColor: const Color(0xff2A2A2A),
            fieldHeight: 50.h,
            fieldWidth: 65.w,
            selectedBorderWidth: .5.w,
          ),
        );
      },
    );
  }
}
