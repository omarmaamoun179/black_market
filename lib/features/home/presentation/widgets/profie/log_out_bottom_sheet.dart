import 'package:black_market/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<String>('user');
    String? token = box.get(Constant.accessToken);
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
              InkWell(
                onTap: () {
                  box.clear();
                  Navigator.pop(context);
                },
                child: Container(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
