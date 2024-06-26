import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankWidgetItem extends StatelessWidget {
  BankWidgetItem(
      {super.key,
      this.text,
      this.container,
      this.banksModel,
      this.index = 0,
      this.bankPrice,
      this.id,
      this.blackMarketPrice,
      this.icon});
  String? text;
  String? imagePath;
  Widget? icon;
  Widget? container;

  BanksModel? banksModel;
  BankPrice? bankPrice;
  BlackMarketPrice? blackMarketPrice;
  int index = 0;
  int? id = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesSuccessState) {}
      },
      builder: (context, state) {
        // bool isBankId25 = banksModel?.id == 25;

        return Container(
          margin: const EdgeInsets.all(12),
          width: 156.w,
          height: 134.3.h,
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(7.7.r),
            border: Border.all(
              width: .5.w,
              color: const Color(0xff4F4F4F),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 14.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  icon ?? const Text(''),
                  CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    maxRadius: 25.r,
                    child: CachedNetworkImage(
                      imageUrl: '${Constant.storage}${banksModel?.icon ?? ' '}',
                      // height: 46.h,
                      // width: 46.w,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    width: 25.5.w,
                    height: 25.5.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: .78.w,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                    child: Icon(
                      Icons.share,
                      size: 12.sp,
                      color: const Color(0xffF1F0FA),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                maxLines: 1,
                textAlign: TextAlign.center,
                banksModel?.name ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFFFFF),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CoulmnText(
                      text: 'شراء'.tr(),
                      text2: '${bankPrice?.buyPrice ?? '0'}',
                      style2: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    VerticalDivider(
                      color: const Color(0xff4F4F4F),
                      indent: 18.h,
                      width: 18.w,
                    ),
                    CoulmnText(
                      color1: const Color(0xffffffff),
                      text: 'بيع'.tr(),
                      text2: '${bankPrice?.sellPrice ?? '0'}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
