import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldThirdTabWidget extends StatelessWidget {
  const GoldThirdTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0xff2A2A2A),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ExpansionTile(
                        collapsedIconColor: const Color(0xffFFFFFF),
                        title: Text(
                          '1جرام ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                        iconColor: const Color(0xffFFFFFF),
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1جرام ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.9)),
                                    ),
                                    Text(
                                      '2250',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.9)),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                              itemCount: 5)
                        ]),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: 20),
        )
      ],
    );
  }
}
