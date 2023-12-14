import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        var cubit = NotificationCubit.get(context);
        return Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      color: Color(0xff2A2A2A),
                      thickness: 1.5,
                    ),
                  ),
                  Text(
                    cubit.formatDateTime(cubit.articels.isNotEmpty
                            ? cubit.articelsDetails[0].createdAt!
                            : DateTime.now()) ??
                        '',
                    style: TextStyle(
                      color: const Color(0xff838A93),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xff2A2A2A),
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      cubit.scrollController.position.extentAfter == 0) {
                    cubit.loadMoreArticels();
                  }
                  return false;
                },
                child: ListView.separated(
                  controller: cubit.scrollController,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
                  itemCount: cubit.articelsDetails.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        cubit.getArticelsDetails();
                        Navigator.pushNamed(
                          context,
                          Routes.articlesDetails,
                          arguments: cubit.articelsDetails[index],
                        );
                      },
                      child: Card(
                        color: const Color(0xff2A2A2A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        clipBehavior: Clip.none,
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        surfaceTintColor: const Color(0xffFFFFFF),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        '${Constant.storage}${cubit.articelsDetails[index].thumbnail}' ??
                                            '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      cubit.articelsDetails[index].title ?? '',
                                      style: TextStyle(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                cubit.articelsDetails[index].shortDescription ??
                                    '',
                                style: TextStyle(
                                  color: const Color(0xffD2D2D2),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                cubit.formatTime(
                                        cubit.articelsDetails.isNotEmpty
                                            ? cubit.articels[index].createdAt ??
                                                DateTime.now()
                                            : DateTime.now()) ??
                                    '',
                                style: TextStyle(
                                  color: const Color(0xff838A93),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (state is ArticlesLoadingState)
              const Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffFFA200),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
