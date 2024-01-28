import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/widgets/profie/log_out_bottom_sheet.dart';
import 'package:black_market/features/home/presentation/widgets/profie/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Box<String> box;
  late String? token;

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>('user');
    token = box.get(Constant.accessToken);
  }

  void updateLoginState() {
    setState(() {
      token = box.get(Constant.accessToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return token == null
        ? const NotLoginWidget()
        : AlreadyLoginWidget(
            updateLoginState: updateLoginState,
          );
  }
}

class AlreadyLoginWidget extends StatelessWidget {
  const AlreadyLoginWidget({
    super.key,
    required this.updateLoginState,
  });
  final VoidCallback updateLoginState;

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
            alignment: Alignment.center,
            width: 82.w,
            height: 82.h,
            decoration: const BoxDecoration(
              color: Color(0xffE5C600),
              shape: BoxShape.circle,
            ),
            child: Text(
              textAlign: TextAlign.center,
              HomeCubit.get(context).profileModel?.name?.substring(0, 1) ?? '',
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
            HomeCubit.get(context).profileModel?.name ?? '',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xffE5C600),
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          const Row(
            children: [],
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
                        return LogOutBottomSheet(
                          updateLoginState: updateLoginState,
                        );
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

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'هذه الصفحه مخصصة للمستخدمين المسجلين فقط',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xffE5C600)),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Container(
              alignment: Alignment.center,
              width: 220.w,
              height: 52.h,
              decoration: BoxDecoration(
                color: const Color(0xff2A2A2A),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text('تسجيل الدخول',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE5C600))),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.register);
            },
            child: Container(
              alignment: Alignment.center,
              width: 220.w,
              height: 52.h,
              decoration: BoxDecoration(
                color: const Color(0xff2A2A2A),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text('انشاء حساب جديد',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE5C600))),
            ),
          ),
        ],
      ),
    ));
  }
}
