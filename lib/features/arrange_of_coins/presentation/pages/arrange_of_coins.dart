import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/features/arrange_of_banks/presentation/widgets/proxy_decorater.dart';
import 'package:black_market/features/arrange_of_banks/presentation/widgets/warninng_message.dart';
import 'package:black_market/features/arrange_of_coins/presentation/widgets/list_tile_coins.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrangeCoins extends StatefulWidget {
  const ArrangeCoins({
    super.key,
    this.title,
  });
  final String? title;

  @override
  State<ArrangeCoins> createState() => _ArrangeCoinsState();
}

class _ArrangeCoinsState extends State<ArrangeCoins> {
  @override
  Widget build(BuildContext context) {
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
                      'اضغط مطولا علي اي عملة لتغير ترتيب \n يمكنك تغير هذه القائمة لاحقا',
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
                  child: ReorderableListView.builder(
                    proxyDecorator: proxyDecorator,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final item = cubit.banksModel!.removeAt(oldIndex);
                        cubit.banksModel!.insert(newIndex, item);
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = cubit.coinsModel![index];
                      return ListTileCoinsWidget(
                        key: ValueKey(
                            '${cubit.coinsModel![index].hashCode}_$index'),
                        coinsModel: item,
                        index: index,
                      );
                    },
                    itemCount: cubit.coinsModel!.length,
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
                    onPressed: () {},
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
