import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({
    super.key,
    this.banksModel,
  });
  BanksModel? banksModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeCurrcinesSuccessState) {}
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Container(
          width: 327.w,
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: cubit.coinsModel?.length ?? 0,
            itemBuilder: (context, index) {
              List<Widget> widget = [];
              Set<int> uniqueBankIds = <int>{};
              for (var e in cubit.coinsModel![index].bankPrices!) {
                if (e.bankId == banksModel!.id &&
                    uniqueBankIds.add(e.bankId!)) {
                  widget.add(
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                '${Constant.storage}${HomeCubit.get(context).coinsModel?[index].icon ?? ''}',
                            height: 22.h,
                            width: 22.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              HomeCubit.get(context).coinsModel?[index].name ??
                                  '',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${e.sellPrice ?? '0'}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFEDC00),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${e.buyPrice ?? '0'}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFEDC00),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
              return Column(
                children: widget,
              );
            },
          ),
        );
      },
    );
  }
}
