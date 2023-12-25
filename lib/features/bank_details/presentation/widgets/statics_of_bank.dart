import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatictsOfBank extends StatelessWidget {
  StatictsOfBank(
      {super.key,
      this.coulmnText1,
      this.coulmnText2,
      this.coulmnText3,
      this.banksModel});
  CoulmnText? coulmnText1;
  CoulmnText? coulmnText2;
  CoulmnText? coulmnText3;
  BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .118,
      width: w * .9,
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //هنا هيبقي في agrument صورة البنك واسمه
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: '${Constant.storage}${banksModel?.icon ?? ''}',
                      fit: BoxFit.cover,
                      width: 25.5.w,
                      height: 25.h.h,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      banksModel?.name ?? 'البنك',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  coulmnText1!,
                  coulmnText2!,
                  coulmnText3 ?? CoulmnText(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
