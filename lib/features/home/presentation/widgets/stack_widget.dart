import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
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
                            'http://voipsys.space/storage/${selectedCoinsModel?.icon ?? ''}',
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
            ],
          ),
        );
      },
    );
  }
}

class DialogCoinsWidget extends StatelessWidget {
  const DialogCoinsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: 300.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: HomeCubit.get(context).coinsModel?.length ?? 0,
        itemBuilder: (context, index) {
          // Check if the current coin has prices for the current bank

          // Display the coin only if it has prices for the current bank

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                HomeCubit.get(context).updateSelectedCoin(
                    HomeCubit.get(context).coinsModel?[index]);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    HomeCubit.get(context).coinsModel?[index].name ??
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
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
