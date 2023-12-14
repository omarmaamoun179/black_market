import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:black_market/features/notification/presentation/pages/article_tab.dart';
import 'package:black_market/features/notification/presentation/pages/notifaction_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifactionScreen extends StatelessWidget {
  const NotifactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(
        NotifactionRepoImp(),
      )
        ..getNotifaction()
        ..getArticels()
        ,
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          var cubit = NotificationCubit.get(context);
          return Scaffold(
              body: SafeArea(
            child: DefaultTabController(
              length: cubit.tabs.length,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(0xff2A2A2A),
                    ),
                    child: TabBar(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        dividerColor: Colors.transparent,
                        indicatorColor: const Color.fromRGBO(254, 220, 0, 1),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xffFEDC00),
                        ),
                        unselectedLabelColor: const Color(0xffFFFFFF),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E0E0E),
                        ),
                        onTap: (index) {
                          cubit.changeTab(index);
                        },
                        tabs: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(cubit.tabs[0]),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(cubit.tabs[1]),
                          ),
                        ]),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        NotifactionTab(),
                        ArticlesTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
