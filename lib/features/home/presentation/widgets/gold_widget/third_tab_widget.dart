import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldThirdTabWidget extends StatelessWidget {
  const GoldThirdTabWidget({
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
                      cubit.updateSelectedCompnies(
                          cubit.compniesModel[index], index);
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://voipsys.space/storage/${cubit.compniesModel[index].image}',
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
                              color: cubit.textIndex == index
                                  ? Colors.yellow
                                  : const Color(0xffFFFFFF)),
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
                itemCount: cubit.ingotsModel?.coins?.length ?? 0,
                itemBuilder: (context, index) {
                  List<Widget> RelatedToBCompany = [];
                  var e = cubit.ingotsModel!.coins![index];

                  for (var i in e.companiesData!) {
                    if (i.companyId == cubit.selectedCompnies!.id) {
                      print(e.name);
                      RelatedToBCompany.add(
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xff2A2A2A),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: ExpansionTile(
                              collapsedIconColor: const Color(0xffFFFFFF),
                              title: Text(
                                e.name ?? '',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffFFFFFF),
                                ),
                              ),
                              iconColor: const Color(0xffFFFFFF),
                              children: [
                                Column(
                                  children: [
                                    Row(
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
                                          '${e.price!.sellPrice!}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'مصنعية الجرام',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                        Text(
                                          '${i.workmanship}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الضريبة الكلية',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                        Text(
                                          '${i.tax * e.weight}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'السعر الكلي',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                        Text(
                                          '${e.price!.sellPrice! * e.weight! + i.tax * e.weight! + i.workmanship!}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'البملغ المسترد',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                        Text(
                                          '${i.returnFees}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الفرق',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                        Text(
                                          '${i.workmanship - i.returnFees!}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }

                  return Column(
                    children: RelatedToBCompany,
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
