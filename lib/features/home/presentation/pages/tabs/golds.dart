import 'package:black_market/features/home/presentation/widgets/gold_widget/first_tab_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/gold_app_bar_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/sec_tab_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/tab_bar_widget.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/third_tab_widget.dart';
import 'package:black_market/features/home/presentation/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldsScreen extends StatefulWidget {
  const GoldsScreen({super.key});

  @override
  State<GoldsScreen> createState() => _GoldsScreenState();
}

List<String> tabs = ['الذهب', 'السبائك', 'العملات'];
int selectedIndex = 0;
late TabController tabController;

class _GoldsScreenState extends State<GoldsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: tabs.length,
    );
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const GoldsAapBar(),
          SizedBox(
            height: 12.h,
          ),
          DefaultTabController(
            length: 3,
            child: Container(
              width: 327.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: const Color(0xff2A2A2A),
              ),
              child: TabBar(
                controller: tabController,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                indicator:
                    const UnderlineTabIndicator(borderSide: BorderSide.none),
                onTap: (index) {
                  selectedIndex = index;

                  setState(() {});
                },
                tabs: tabs
                    .map(
                      (e) => GoldTabWidget(
                        isSelected: selectedIndex == tabs.indexOf(e),
                        txt: e,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                GoldFirstTabWidget(),
                GoldSecTabWidget(),
                GoldThirdTabWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
