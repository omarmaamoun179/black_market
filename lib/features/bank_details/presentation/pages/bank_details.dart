import 'package:black_market/features/bank_details/presentation/widgets/calc_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/statics_of_bank.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ConisAppBar(),
            Expanded(
              child: ListView(
                physics: const PageScrollPhysics(),
                children: [
                  SizedBox(height: 70.h),
                  Container(
                    height: 85.h,
                    width: 327.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFEDC00),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        //هنا هيبقي في agrument صورة البنك واسمه
                        Text(
                          ' دولار أمريكي /Usd ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff4F4F4F),
                          ),
                        ),

                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CoulmnText(
                                text: 'شراء',
                                text2: '30.65',
                                color1: const Color(0xff362727),
                                color2: const Color(0xff0E0E0E),
                              ),
                              VerticalDivider(
                                color: const Color(0xff4F4F4F),
                                indent: 12.5.h,
                                width: 25.w,
                              ),
                              CoulmnText(
                                text: 'بيع',
                                text2: '35',
                                color1: const Color(0xff362727),
                                color2: const Color(0xff0E0E0E),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    width: 327.w,
                    height: 121.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff2A2A2A),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const CalculaterWidget(),
                  ),
                  SizedBox(height: 18.h),
                  const InfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConisAppBar extends StatelessWidget {
  const ConisAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Container(
                margin: EdgeInsets.only(bottom: 230.h),
                decoration: BoxDecoration(
                  color: const Color(0xff0E0E0E).withOpacity(.4),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
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
            child: StatictsOfBank(
              coulmnText1: CoulmnText(
                text: 'البنك',
                text2: '30.65',
                color2: const Color(0xff4F4F4F),
              ),
              coulmnText2: CoulmnText(
                text: 'أخر تحديث',
                text2: 'منذ 15 دقيقة',
                color2: const Color(0xff4F4F4F),
              ),
              coulmnText3: CoulmnText(
                text: 'السوق السوداء',
                text2: '50.65',
                color2: const Color(0xffBFA500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 284.h,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'العمله',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'شراء',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                Text(
                  'بيع',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: const Color(0xff967373),
            indent: 28.w,
            endIndent: 28.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              primary: false,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'دولار أمريكي /Usd',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '30.65',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFEDC00),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '35',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFEDC00),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
