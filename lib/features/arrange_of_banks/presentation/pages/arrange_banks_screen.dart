import 'package:black_market/core/local/save_banks.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/features/arrange_of_banks/presentation/widgets/list_tile_bank_widget.dart';
import 'package:black_market/features/arrange_of_banks/presentation/widgets/proxy_decorater.dart';
import 'package:black_market/features/arrange_of_banks/presentation/widgets/warninng_message.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrangeBanks extends StatefulWidget {
  const ArrangeBanks({
    super.key,
    this.title,
  });
  final String? title;

  @override
  State<ArrangeBanks> createState() => _ArrangeBanksState();
}

class _ArrangeBanksState extends State<ArrangeBanks> {
  @override
  Widget build(BuildContext context) {
    var savedBanks = LocaleBankService.getBanks();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomAppBar(
                  title: widget.title!,
                  icon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                WarningMessage(
                  message:
                      'اضغط مطولا علي اي بنك لتغير ترتيب \n يمكنك تغير هذه القائمة لاحقا',
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'اختر الترتيب الفضل للبنوك',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xfffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Expanded(
                  child: ReorderableListView(
                    proxyDecorator: proxyDecorator,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        for (var e in cubit.banksModel!) {
                          for (var i in cubit.selectedCoin!.bankPrices!) {
                            if (e.id == i.bankId) {}
                          }
                        }
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final item = cubit.banksModel?.removeAt(oldIndex);
                        // final blackMarket = cubit
                        //     .selectedCoin!.blackMarketPrices
                        //     ?.removeAt(oldIndex);

                        final bankprice =
                            cubit.selectedCoin!.bankPrices?.removeAt(oldIndex);
                        cubit.banksModel!.insert(newIndex, item!);
                        // cubit.selectedCoin!.blackMarketPrices!
                        //     .insert(newIndex, blackMarket!);
                        cubit.selectedCoin!.bankPrices!
                            .insert(newIndex, bankprice!);

                        print(
                            cubit.selectedCoin!.bankPrices![newIndex].buyPrice);
                      });
                    },
                    children: cubit.banksModel!
                        .map(
                          (e) => ListTileBankWidget(
                            key: ValueKey(e.hashCode),
                            banksModel: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(327.w, 48.h),
                      backgroundColor: const Color(0xffFEDC00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      // Assuming HomeCubit is accessible from the context
                      var cubit = HomeCubit.get(context);

                      // Assuming banksModel is not null, otherwise, handle accordingly
                      if (cubit.banksModel != null) {
                        // Save the new arrangement to local storage
                        LocaleBankService.saveBanks(cubit.banksModel!);

                        // Optionally, you can show a message or perform any other actions
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم حفظ الترتيب بنجاح'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'حفظ الترتيب',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0D0D0D),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
