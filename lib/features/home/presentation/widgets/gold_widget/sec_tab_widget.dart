import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldSecTabWidget extends StatelessWidget {
  const GoldSecTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                itemCount: cubit.compniesModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20.w,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      cubit.updateSelectedCompnies(cubit.compniesModel[index]);
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'http://voipsys.space/storage/${cubit.compniesModel[index].image}',
                          imageBuilder: (context, imageProvider) => Container(
                            width: 65.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          cubit.compniesModel[index].name ?? '',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFFFFFF)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: cubit.ingotsModel?.ingots?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xff2A2A2A),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ExpansionTile(
                          collapsedIconColor: const Color(0xffFFFFFF),
                          title: Text(
                            cubit.ingotsModel?.ingots?[index].name ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                          iconColor: const Color(0xffFFFFFF),
                          children: [
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1جرام ',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.9)),
                                      ),
                                      Text(
                                        '2250',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.9)),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                itemCount: 3)
                          ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
