import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifactionTab extends StatelessWidget {
  const NotifactionTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        var cubit = NotificationCubit.get(context);
        return cubit.articels.isEmpty
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xffFFA200)),
              )
            : Column(
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
                          cubit.formatDateTime(cubit.nots.isNotEmpty
                                  ? cubit.nots[0].createdAt!
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
                          cubit.loadMoreData();
                        }
                        return false;
                      },
                      child: ListView.separated(
                        controller: cubit.scrollController,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                        itemCount: cubit.nots.length ?? 0,
                        itemBuilder: (context, index) {
                          return Card(
                            color: const Color(0xff2A2A2A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            clipBehavior: Clip.none,
                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                            surfaceTintColor: const Color(0xffFFFFFF),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.nots[index].title ?? '',
                                    style: TextStyle(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    cubit.nots[index].body ?? '',
                                    style: TextStyle(
                                      color: const Color(0xffD2D2D2),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        cubit.formatTime(cubit.nots.isNotEmpty
                                                ? cubit.nots[index]
                                                        .scheduleAt ??
                                                    DateTime.now()
                                                : DateTime.now()) ??
                                            '',
                                        style: TextStyle(
                                          color: const Color(0xff838A93),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        cubit.nots[index].readsCount
                                                .toString() ??
                                            '',
                                        style: TextStyle(
                                          color: const Color(0xff838A93),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: const Color(0xffFFFFFF),
                                        size: 15.sp,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (state is NotificationLoading)
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
