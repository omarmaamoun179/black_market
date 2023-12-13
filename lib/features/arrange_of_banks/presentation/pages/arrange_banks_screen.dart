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
                      final item = cubit.banksModel![index];
                      return ListTileBankWidget(
                        key: ValueKey(
                            '${cubit.banksModel![index].hashCode}_$index'),
                        banksModel: item,
                        index: index,
                      );
                    },
                    itemCount: cubit.banksModel!.length,
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
