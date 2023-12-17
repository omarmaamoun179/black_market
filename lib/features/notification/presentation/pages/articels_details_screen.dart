import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class ArticelsDetailsScreen extends StatelessWidget {
  ArticelsDetailsScreen({super.key, this.id});
  int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(
        NotifactionRepoImp(),
      )..getArticelsDetails(
          id!,
        ),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          var cubit = NotificationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${Constant.storage}${cubit.articelsDetailsModel?.thumbnail}',
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        width: double.infinity,
                        height: 200.h,
                      ),
                      Positioned(
                        top: 180.h,
                        left: 10.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Share.share('شارك هذه المقالة');
                            },
                            icon:
                                const Icon(Icons.ios_share, color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Text(
                        cubit.articelsDetailsModel?.title ?? '',
                        style: TextStyle(
                            color: const Color(0xffFFFFFF),
                            fontSize: 17.0.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              cubit.formatTime(
                                      cubit.articelsDetailsModel?.updatedAt ??
                                          DateTime.now()) ??
                                  '',
                            ),
                          ),
                        ],
                      ),
                      Html(
                        data: cubit.articelsDetailsModel?.description ?? '',
                        style: {
                          'body': Style(
                            color: const Color(0xffFFFFFF).withOpacity(.9),
                            fontSize: FontSize(13.0.sp),
                            fontWeight: FontWeight.w200,
                          ),
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'التعليقات',
                            style: TextStyle(
                                color: const Color(0xffFFFFFF),
                                fontSize: 17.0.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              ' عرض التعليقات',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CoulmnText(
                          text: cubit.articelsDetailsModel?.comments?.isEmpty ==
                                  true
                              ? ''
                              : cubit.articelsDetailsModel?.comments?.first
                                      .userName ??
                                  '',
                          style1: TextStyle(
                              color: Colors.blue,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w700),
                          text2:
                              cubit.articelsDetailsModel?.comments?.isEmpty ==
                                      true
                                  ? ''
                                  : cubit.articelsDetailsModel?.comments?.first
                                          .comment ??
                                      '',
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
