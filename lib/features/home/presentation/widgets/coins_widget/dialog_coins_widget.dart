import 'package:black_market/core/local/save_coins.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogCoinsWidget extends StatelessWidget {
  const DialogCoinsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var savedCoins = LocaleCoinsService.getCoins();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => ListView.builder(
        shrinkWrap: true,
        itemCount: savedCoins.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                HomeCubit.get(context).updateSelectedCoin(
                  savedCoins[index],
                );
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    savedCoins[index].name ?? 'الدولار الأمريكي',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff4F4F4F),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: '${Constant.storage}${savedCoins[index].icon}',
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
