import 'package:black_market/features/home/presentation/widgets/gold_widget/tab_bar_widget.dart';
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
      create: (context) => NotificationCubit(),
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
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide.none),
                      onTap: (index) {
                        cubit.changeTab(index);
                      },
                      tabs: cubit.tabs
                          .map((e) => GoldTabWidget(
                                isSelected:
                                    cubit.currentIndex == cubit.tabs.indexOf(e),
                                txt: e,
                              ))
                          .toList(),
                    ),
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
