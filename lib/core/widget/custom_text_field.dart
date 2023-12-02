import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText,
    this.keyBoardType,
    required this.lableText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPressed,
    this.hasSuffixIcon,
    this.textInputAction,
    this.validator,
  });

  final TextEditingController controller;
  final TextInputType? keyBoardType;
  final String lableText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Function? suffixIconPressed;
  final bool? hasSuffixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: TextStyle(
          color: const Color(0xffFFFFFF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w700),
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        focusedBorder: outLineInputBorder(),
        label: Text(lableText),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: const Color(0xff2A2A2A),
        filled: true,
        enabledBorder: outLineInputBorder(),
        errorBorder: outLineInputBorder(),
        focusedErrorBorder: outLineInputBorder(),
      ),
    );
  }

  outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0.r),
    );
  }
}
