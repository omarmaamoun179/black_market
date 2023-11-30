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

class _GoldsScreenState extends State<GoldsScreen> {
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
            child: GridView.builder(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                childAspectRatio: 7 / 8,
                mainAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: BankWidgetGridView(
                    imagePath: 'assets/images/gold_image.png',
                    text: 'ذهب عيار22',
                    container: Padding(
                        padding: EdgeInsets.only(left: 25.w),
                        child: const Text('')),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GoldsAapBar extends StatelessWidget {
  const GoldsAapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 117.w),
          child: Text(
            'الذهب',
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: CustomDialogWidget(),
                  );
                });
          },
          icon: Icon(
            Icons.calculate,
            color: const Color(0xffFFC907),
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xff2A2A2A),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 64.h,
          ),
          SizedBox(
            width: 291.w,
            height: 32.h,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'السعر الحالي للذهب',
                hintStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff968787),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff968787), width: .5.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff968787), width: .5.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 138.w,
                height: 32.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'الوزن بالجرام',
                    hintStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff968787),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 138.w,
                height: 32.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: ' العيار ',
                    hintStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff968787),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff968787), width: .5.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.w,
          ),
          Container(
            margin: EdgeInsets.only(
                left: 62.w, right: 62.w, bottom: 18.h, top: 24.h),
            width: 167.w,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: const Color(0xffFFC907),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'حساب مصنعية الذهب',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff0D0D0D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoldTabWidget extends StatelessWidget {
  GoldTabWidget({
    super.key,
    required this.isSelected,
    required this.txt,
  });
  String txt;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94.w,
      height: 44.h,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffFEDC00) : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: isSelected ? 16.sp : 14.sp,
            fontWeight: FontWeight.w700,
            color:
                isSelected ? const Color(0xff0E0E0E) : const Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
