import 'package:black_market/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'البروفايل',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 82.w,
            height: 82.h,
            decoration: const BoxDecoration(
              color: Color(0xffE5C600),
              shape: BoxShape.circle,
            ),
            child: Text(
              textAlign: TextAlign.center,
              'ع',
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'عمر مأمون',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xffE5C600),
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          profileItemWidget(
            icon: Icons.person,
            text: 'تعديل الملف الشخصي',
          ),
          SizedBox(
            height: 16.h,
          ),
          profileItemWidget(
            icon: Icons.monetization_on_outlined,
            text: 'العملات',
          ),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.saving,
                    arguments: 'مدخراتي');
              },
              child: profileItemWidget(
                icon: Icons.wallet,
                text: 'مدخراتي',
              )),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.setting,
                  arguments: 'الاعدادات');
            },
            child: profileItemWidget(
              icon: Icons.settings,
              text: 'الاعدادات',
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      )),
                      backgroundColor: const Color(0xff2A2A2A),
                      context: context,
                      builder: (BuildContext context) {
                        return const LogOutBottomSheet();
                      });
                },
                child: Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFF2A2A),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.logout,
                color: const Color(0xffFF2A2A),
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 374.h,
      width: 375.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              alignment: Alignment.topRight),
          Column(
            children: [
              Text(
                'هل انت متأكد من تسجيل الخروج ؟',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Icon(
                Icons.error,
                color: Colors.red,
                size: 96.sp,
              ),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Divider(
                  color: const Color(0xffFFFFFF).withOpacity(.2),
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 180.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0XffFF2A2A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(14.r),
                  ),
                ),
                child: Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class profileItemWidget extends StatelessWidget {
  profileItemWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  IconData? icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xffFAFAFA),
              size: 24.sp,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFAFAFA),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xffFAFAFA),
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
