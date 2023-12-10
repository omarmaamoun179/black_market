import 'package:black_market/features/bank_details/presentation/widgets/bank_details_appbar.dart';
import 'package:black_market/features/bank_details/presentation/widgets/calc_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/info_widget.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  BankDetails({
    super.key,
    this.banksModel,
  });
  BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesSuccessState) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                BankDetailsAppBar(
                  banksModel: banksModel!,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        height: 100.h,
                        width: 327.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFEDC00),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: CurrciensInBank(banksModel: banksModel),
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
                      const HeadOfInfoWidget(),
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        decoration: const BoxDecoration(
                          color: Color(0xff2A2A2A),
                        ),
                        child: Divider(
                          color: const Color(0xff967373),
                          indent: 28.w,
                          endIndent: 28.w,
                        ),
                      ),
                      InfoWidget(
                        banksModel: banksModel!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeadOfInfoWidget extends StatelessWidget {
  const HeadOfInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      width: 327.w,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
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
    );
  }
}

class CurrciensInBank extends StatelessWidget {
  const CurrciensInBank({
    super.key,
    required this.banksModel,
  });

  final BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              HomeCubit.get(context).selectedCoin?.name ?? 'الدولار الأمريكي',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff4F4F4F),
              ),
            ),
            CachedNetworkImage(
              imageUrl:
                  'http://voipsys.space/storage/${HomeCubit.get(context).selectedCoin?.icon}',
              width: 20.5.w,
              height: 20.5.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 300.h,
                        width: 300.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              HomeCubit.get(context).coinsModel?.length ?? 0,
                          itemBuilder: (context, index) {
                            // Check if the current coin has prices for the current bank
                            bool hasPricesForBank = HomeCubit.get(context)
                                    .coinsModel?[index]
                                    .bankPrices
                                    ?.any((price) =>
                                        price.bankId == banksModel?.id) ??
                                false;

                            // Display the coin only if it has prices for the current bank
                            if (hasPricesForBank) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: () {
                                    HomeCubit.get(context).updateSelectedCoin(
                                        HomeCubit.get(context)
                                            .coinsModel?[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        HomeCubit.get(context)
                                                .coinsModel?[index]
                                                .name ??
                                            'الدولار الأمريكي',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff4F4F4F),
                                        ),
                                      ),
                                      CachedNetworkImage(
                                        imageUrl:
                                            'http://voipsys.space/storage/${HomeCubit.get(context).coinsModel?[index].icon}',
                                        width: 26.5.w,
                                        height: 26.5.h,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // Return an empty container if the coin doesn't have prices for the bank
                              return Container();
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CoulmnText(
              text: 'شراء',
              color1: const Color(0xff0E0E0E),
              text2:
                  '${HomeCubit.get(context).selectedCoin?.bankPrices?[0].buyPrice ?? ''}',
              style2: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xff0E0E0E),
              ),
            ),
            CoulmnText(
              color1: const Color(0xff0E0E0E),
              text: 'أخر تحديث',
              text2:
                  'منذ ${HomeCubit.get(context).selectedCoin?.updatedAt?.minute ?? ''} دقيقة ',
              color2: const Color(0xff2a2a2a),
            ),
            CoulmnText(
              color1: const Color(0xff0E0E0E),
              text: 'بيع',
              text2:
                  '${HomeCubit.get(context).selectedCoin?.bankPrices?[0].sellPrice ?? ''}',
              color2: const Color(0xff0E0E0E),
            ),
          ],
        ),
      ],
    );
  }
}
