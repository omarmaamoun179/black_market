import 'package:black_market/config/router/routes.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/bank_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const PageScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit.selectedCoin?.bankPrices?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        var currentBank = cubit.banksModel?[index];

        // Check if the current bank's id is 25
        if (currentBank?.id == 25) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.bankDetails,
                arguments: currentBank,
              );
            },
            child: BankWidgetItem(
              blackMarketPrice:
                  cubit.selectedCoin?.blackMarketPrices?.isEmpty ?? true
                      ? null
                      : cubit.selectedCoin?.blackMarketPrices?[0],

              banksModel: currentBank, // Use the current bank's data
              imagePath: currentBank?.icon ?? '',
              icon: Icon(
                Icons.favorite_border,
                size: 12.sp,
                color: const Color(0xffF1F0FA),
              ),
              text: currentBank?.name ?? '',
            ),
          );
        } else {
          // Handle other banks (not with id == 25)
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.bankDetails,
                arguments: currentBank,
              );
            },
            child: BankWidgetItem(
              index: index,
              bankPrice: cubit.selectedCoin?.bankPrices?.isEmpty ?? true
                  ? null
                  : cubit.selectedCoin?.bankPrices?[index],
              banksModel: currentBank,
              imagePath: currentBank?.icon ?? '',
              icon: Icon(
                Icons.favorite_border,
                size: 12.sp,
                color: const Color(0xffF1F0FA),
              ),
              text: currentBank?.name ?? '',
            ),
          );
        }
      },
    );
  }
}
