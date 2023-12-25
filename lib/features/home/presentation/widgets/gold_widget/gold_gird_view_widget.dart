import 'package:black_market/features/home/data/models/golds_model/golds_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldWidgetGridView extends StatelessWidget {
  GoldWidgetGridView(
      {super.key,
      this.text,
      this.imagePath,
      this.icon,
      this.container,
      this.goldsModel});
  String? text;
  String? imagePath;
  Widget? icon;
  Widget? container;
  GoldsModel? goldsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGoldsSuccessState) {}
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(12),
          width: 156.w,
          height: 134.3.h,
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(7.7.r),
            border: Border.all(
              width: .5.w,
              color: const Color(0xff4F4F4F),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 14.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  container ??
                      Container(
                        width: 25.5.w,
                        height: 25.5.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: .78.w,
                            color: const Color(0xff4F4F4F),
                          ),
                        ),
                        child: icon ?? const Text(''),
                      ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://voipsys.space/storage/${goldsModel?.icon}',
                    height: 46.h,
                    width: 46.w,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    width: 25.5.w,
                    height: 25.5.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: .78.w,
                        color: const Color(0xff4F4F4F),
                      ),
                    ),
                    child: Icon(
                      Icons.share,
                      size: 12.sp,
                      color: const Color(0xffF1F0FA),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                goldsModel?.name ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFFFFF),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CoulmnText(
                      text: 'شراء',
                      text2: '${goldsModel?.price?.buyPrice ?? '15'}',
                      style2: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    VerticalDivider(
                      color: const Color(0xff4F4F4F),
                      indent: 18.h,
                      width: 18.w,
                    ),
                    CoulmnText(
                        color1: const Color(0xffffffff),
                        text: 'بيع',
                        text2: '${goldsModel?.price?.price ?? '15'}'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
