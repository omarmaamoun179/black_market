import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackWidget extends StatelessWidget {
  StackWidget({
    super.key,
    this.livePrice,
    this.blackMarketPrice,
  });

  BlackMarketPrice? blackMarketPrice;
  LivePrice? livePrice;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var selectedCoinsModel = HomeCubit.get(context).selectedCoin;
        return Container(
          height: 96.h,
          width: 327.w,
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<CoinsModel>(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(12.r),
                    itemHeight: 50.h,
                    value: selectedCoinsModel,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff4F4F4F),
                    ),
                    hint: Text(
                      selectedCoinsModel?.name ?? 'الدولار الأمريكي',
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
                      HomeCubit.get(context).updateSelectedCoin(newValue);
                      // HomeCubit.get(context).getCoinsId(newValue?.id ?? 3);
                    },
                    items: HomeCubit.get(context)
                            .coinsModel
                            ?.map<DropdownMenuItem<CoinsModel>>(
                                (CoinsModel? value) {
                          return DropdownMenuItem<CoinsModel>(
                            value: value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value?.name ?? 'الدولار الأمريكي',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff4F4F4F),
                                  ),
                                ),
                                CachedNetworkImage(
                                  imageUrl:
                                      'http://voipsys.space/storage/${value?.icon ?? ''}',
                                  width: 25.5.w,
                                  height: 25.5.h,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CoulmnText(
                    text: 'سعر البنك',
                    text2: '${livePrice?.price ?? ''}',
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
                    text2: '${blackMarketPrice?.sellPrice ?? ''}',
                    color2: const Color(0xff2a2a2a),
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
