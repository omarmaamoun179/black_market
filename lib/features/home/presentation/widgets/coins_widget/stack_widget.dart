import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/dialog_coins_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackWidget extends StatelessWidget {
  StackWidget({
    super.key,
    // this.livePrice,
    this.blackMarketPrice,
    this.bankPrice,
  });

  BlackMarketPrice? blackMarketPrice;
  // LivePrice? livePrice;
  BankPrice? bankPrice;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size.width;
        var selectedCoinsModel = HomeCubit.get(context).selectedCoin;
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        selectedCoinsModel?.name ?? 'الدولار الأمريكي',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff4F4F4F),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            '${Constant.storage}${selectedCoinsModel?.icon ?? ''}',
                        width: 20.5.w,
                        height: 20.5.h,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Dialog(
                                child: DialogCoinsWidget(),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CoulmnText(
                          text: "سعر البنك".tr(),
                          text2: '${bankPrice?.sellPrice ?? ''}',
                          style2: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xffBFA500),
                          ),
                        ),
                        const VerticalDivider(
                          color: Color(0xff2a2a2a),
                          thickness: .4,
                        ),
                        CoulmnText(
                          text: "اخر تحديث".tr(),
                          text2:
                              '${"منذ دقيقة".tr()} ${selectedCoinsModel?.updatedAt?.minute ?? ''}',
                          color2: const Color(0xff2a2a2a),
                        ),
                        const VerticalDivider(
                          color: Color(0xff2a2a2a),
                          thickness: .4,
                        ),
                        CoulmnText(
                          text: HomeCubit.get(context).selectedCoin?.id == 17
                              ? ''
                              : "سعر السوق السوداء".tr(),
                          text2: '${blackMarketPrice?.sellPrice ?? ''}',
                          color2: const Color(0xff2a2a2a),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
