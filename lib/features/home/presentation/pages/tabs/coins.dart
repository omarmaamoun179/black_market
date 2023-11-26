import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 300.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xff1A1A1A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 38.r,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 48.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحبا',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffB4B4B4),
                          ),
                        ),
                        Text(
                          'عمر مأمون',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 230.h),
                      decoration: BoxDecoration(
                        color: const Color(0xff0E0E0E).withOpacity(.4),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  'Black<Market',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffFEDC00)),
                ),
                Positioned(
                  bottom: 70.h,
                  child: Text(
                    ' بكام في السوق السوداء ؟',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffFFF4B0)),
                  ),
                ),
                Positioned(
                  top: 230.h,
                  child: Container(
                    height: 92.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                      color: const Color(0xfffafafa),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          ' دولار أمريكي /Usd ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff4F4F4F),
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CoulmnText(
                              text: 'سعر البنك',
                              text2: '30.65',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xffBFA500),
                              ),
                            ),
                            CoulmnText(
                              text: 'أخر تحديث',
                              text2: 'منذ 15 دقيقة',
                            ),
                            CoulmnText(
                              text: 'السوق السوداء',
                              text2: '50.65',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const DefaultTabController(
            length: 6,
            child: TabBar(
              isScrollable: true,
              
              tabs: [
                Text('سبت'),
                Text('أحد'),
                Text('إثنين'),
                Text('ثلاثاء'),
                Text('أربعاء'),
                Text(
                  'خميس',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoulmnText extends StatelessWidget {
  CoulmnText({
    super.key,
    this.text,
    this.text2,
    this.style,
  });
  String? text;
  String? text2;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text ?? '',
          style: TextStyle(
            color: const Color(0xff828282),
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          text2 ?? '',
          style: style ??
              TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    );
  }
}
