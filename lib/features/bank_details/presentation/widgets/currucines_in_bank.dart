import 'package:black_market/features/bank_details/presentation/widgets/dialog_coins_in_bank.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrciensInBank extends StatelessWidget {
  const CurrciensInBank({
    super.key,
    required this.banksModel,
  });

  final BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    bool isBankId25 = banksModel?.id == 25;
    var cubit = HomeCubit.get(context);
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
            Expanded(
              child: Text(
                HomeCubit.get(context).selectedCoin?.name ?? 'الدولار الأمريكي',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff4F4F4F),
                ),
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
                      child: DialogBankCoins(banksModel: banksModel),
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
                  '${isBankId25 ? cubit.selectedCoin?.blackMarketPrices![0].buyPrice ?? 0 : cubit.selectedCoin?.bankPrices![0].buyPrice ?? '0'}',
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
                  '${isBankId25 ? cubit.selectedCoin?.blackMarketPrices![0].sellPrice : cubit.selectedCoin?.bankPrices![0].sellPrice ?? '0'}',
              color2: const Color(0xff0E0E0E),
            ),
          ],
        ),
      ],
    );
  }
}
