import 'package:black_market/features/home/presentation/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldFirstTabWidget extends StatelessWidget {
  const GoldFirstTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                padding: EdgeInsets.only(left: 25.w), child: const Text('')),
          ),
        );
      },
    );
  }
}
