import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/features/languages/presentation/cubit/languages_cubit.dart';
import 'package:black_market/features/languages/presentation/cubit/languages_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangugaeScreen extends StatelessWidget {
  const LangugaeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguagesCubit(),
      child: BlocBuilder<LanguagesCubit, LanguagesState>(
        builder: (context, state) {
          var cubit = LanguagesCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomAppBar(
                      title: title,
                      icon: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'اختر اللغة',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xfffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      width: 327.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xff2a2a2a),
                      ),
                      child: ListTile(
                        title: Text(
                          'العربية',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xffFFFAD9),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Radio(
                          activeColor: const Color(0xffFEDC00),
                          value: 'ar',
                          groupValue: context.locale.languageCode,
                          onChanged: (value) {
                            final locale = Locale(value!, "SA");
                            context.setLocale(locale);

                            cubit.changeValue(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: 327.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xff2a2a2a),
                      ),
                      child: ListTile(
                        title: Text(
                          'English',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xffFFFAD9),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Radio(
                          activeColor: const Color(0xffFEDC00),
                          value: 'en',
                          groupValue: context.locale.languageCode,
                          onChanged: (value) {
                            final locale = Locale(value!, 'US');
                            context.setLocale(locale);
                            cubit.changeValue(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
