import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/local/save_banks.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/bank_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      List<BanksModel>? savedBanks = LocaleBankService.getBanks();
      Set<int> uniqueBankIds = <int>{};
      List widget = [];
      Set<int> uniqueSaveBankIds = <int>{};

      List saveBankswidget = [];
      var cubit = HomeCubit.get(context);
      for (var e in cubit.banksModel ?? []) {
        for (var i in cubit.selectedCoin?.bankPrices ?? []) {
          if (e.id == i.bankId && uniqueBankIds.add(e.id!)) {
            // LocaleBankService.banksBox.put(e.id, e);
            widget.add(BankWidgetItem(
              blackMarketPrice:
                  cubit.selectedCoin?.blackMarketPrices?.isEmpty ?? true
                      ? null
                      : cubit.selectedCoin?.blackMarketPrices?[0],
              bankPrice: i,
              banksModel: e,
              icon: IconButton(
                onPressed: () {
                  print('clicked');
                  

                  cubit.saveFavBank(e, i, cubit.selectedCoin!);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'تم اضافة ${e.name} الي المفضلة',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffFFC700).withOpacity(.8),
                        ),
                      ),
                      backgroundColor: const Color(0xff0D0D0D),
                      action: SnackBarAction(
                        label: 'تراجع',
                        textColor: const Color(0xffFFC700),
                        onPressed: () {
                          cubit.deleteBank(e , i , cubit.selectedCoin!);
                        },
                      ),
                    ),
                  );
                },
                icon: CircleAvatar(
                  maxRadius: 12.r,
                  backgroundColor: const Color(0xff0D0D0D).withOpacity(.3),
                  child: Icon(
                    Icons.favorite_outline_sharp,
                    size: 12.sp,
                    color: const Color(0xffF1F0FA),
                  ),
                ),
              ),
              text: e.name ?? '',
            ));
          }
        }
      }

      for (var e in savedBanks) {
        for (var i in cubit.selectedCoin?.bankPrices ?? []) {
          if (e.id == i.bankId && uniqueSaveBankIds.add(e.id!)) {
            saveBankswidget.add(BankWidgetItem(
              blackMarketPrice:
                  cubit.selectedCoin?.blackMarketPrices?.isEmpty ?? true
                      ? null
                      : cubit.selectedCoin?.blackMarketPrices?[0],
              bankPrice: i,
              banksModel: e,
              icon: Icon(
                Icons.favorite_border,
                size: 12.sp,
                color: const Color(0xffF1F0FA),
              ),
              text: e.name ?? '',
            ));
          }
          // You code here
        }
      }

      return saveBankswidget.isEmpty
          ? GridView.builder(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: .95,
                childAspectRatio: .95,
                mainAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.bankDetails,
                          arguments: widget[index].banksModel);
                    },
                    child: widget[index]);
              })
          : GridView.builder(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: saveBankswidget.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: .95,
                childAspectRatio: .95,
                mainAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.bankDetails,
                          arguments: saveBankswidget[index].banksModel);
                      print('object');
                    },
                    child: saveBankswidget[index]);
              });
    });
  }
}
/**
 * 
 */
