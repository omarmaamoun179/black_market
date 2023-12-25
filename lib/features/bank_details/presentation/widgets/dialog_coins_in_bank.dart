import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogBankCoins extends StatelessWidget {
  const DialogBankCoins({
    super.key,
    required this.banksModel,
  });

  final BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 300.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: HomeCubit.get(context).coinsModel?.length ?? 0,
        itemBuilder: (context, index) {
          // Check if the current coin has prices for the current bank
          bool hasPricesForBank = HomeCubit.get(context)
                  .coinsModel?[index]
                  .bankPrices
                  ?.any((price) => price.bankId == banksModel?.id) ??
              false;

          // Display the coin only if it has prices for the current bank
          if (hasPricesForBank) {
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
                          '${Constant.storage}${HomeCubit.get(context).coinsModel?[index].icon}',
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
          } else {
            // Return an empty container if the coin doesn't have prices for the bank
            return Container();
          }
        },
      ),
    );
  }
}
