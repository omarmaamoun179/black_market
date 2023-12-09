import 'package:black_market/features/bank_details/presentation/widgets/bank_details_appbar.dart';
import 'package:black_market/features/bank_details/presentation/widgets/calc_widget.dart';
import 'package:black_market/features/bank_details/presentation/widgets/info_widget.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  BankDetails({super.key, this.banksModel});
  BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    var selectedCoinsModel = HomeCubit.get(context).selectedCoin;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesSuccessState) {
          HomeCubit.get(context).updateSelectedCoin(selectedCoinsModel);
        }
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DropdownButton<CoinsModel>(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(12.r),
                                  value: HomeCubit.get(context).selectedCoin,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff4F4F4F),
                                  ),
                                  hint: Text(
                                    selectedCoinsModel?.name ??
                                        'الدولار الأمريكي',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff4F4F4F),
                                    ),
                                  ),
                                  underline: const SizedBox.shrink(),
                                  onChanged: (
                                    newValue,
                                  ) {
                                    // Update the selected coinsModel in the HomeCubit
                                    HomeCubit.get(context)
                                        .updateSelectedCoin(newValue);
                                  },
                                  items: HomeCubit.get(context).selectedCoin !=
                                          null
                                      ? HomeCubit.get(context)
                                          .coinsModel
                                          ?.map<DropdownMenuItem<CoinsModel>>(
                                              (CoinsModel? value) {
                                          return DropdownMenuItem<CoinsModel>(
                                            value: value,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  value?.name ??
                                                      'الدولار الأمريكي',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff4F4F4F),
                                                  ),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      'http://voipsys.space/storage/${value?.icon ?? ''}',
                                                  fit: BoxFit.cover,
                                                  width: 25.5.w,
                                                  height: 25.h.h,
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList()
                                      : [],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CoulmnText(
                                  text: 'سعر البنك',
                                  text2:
                                      '${selectedCoinsModel?.livePrices?[0].price ?? ''}',
                                  style2: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xffBFA500),
                                  ),
                                ),
                                CoulmnText(
                                  text: 'أخر تحديث',
                                  text2:
                                      'منذ ${selectedCoinsModel?.updatedAt?.minute ?? ''} دقيقة ',
                                  color2: const Color(0xff2a2a2a),
                                ),
                                CoulmnText(
                                  text: 'السوق السوداء',
                                  text2:
                                      '${selectedCoinsModel?.blackMarketPrices?[0].sellPrice ?? ''}',
                                  color2: const Color(0xff2a2a2a),
                                ),
                              ],
                            ),

                            //هنا هيبقي في agrument صورة البنك واسمه
                            //   Text(
                            //     ' ${HomeCubit.get(context).selectedCoin?.name} ',
                            //     style: TextStyle(
                            //       fontSize: 12.sp,
                            //       fontWeight: FontWeight.w700,
                            //       color: const Color(0xff4F4F4F),
                            //     ),
                            //   ),

                            //   IntrinsicHeight(
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         CoulmnText(
                            //           text: 'شراء',
                            //           text2:
                            //               ' ${HomeCubit.get(context).selectedCoin?.bankPrices?[0].buyPrice} ',
                            //           color1: const Color(0xff362727),
                            //           color2: const Color(0xff0E0E0E),
                            //         ),
                            //         VerticalDivider(
                            //           color: const Color(0xff4F4F4F),
                            //           indent: 12.5.h,
                            //           width: 25.w,
                            //         ),
                            //         CoulmnText(
                            //           text: 'بيع',
                            //           text2:
                            //               ' ${HomeCubit.get(context).selectedCoin?.bankPrices?[0].sellPrice} ',
                            //           color1: const Color(0xff362727),
                            //           color2: const Color(0xff0E0E0E),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
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
                      Container(
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
                      ),
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
                      const InfoWidget(),
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
