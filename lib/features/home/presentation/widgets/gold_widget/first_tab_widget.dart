import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/widgets/gold_widget/gold_gird_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldFirstTabWidget extends StatelessWidget {
  const GoldFirstTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return GridView.builder(
      physics: const PageScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit.goldsModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: GoldWidgetGridView(
            container: Padding(
                padding: EdgeInsets.only(left: 25.w), child: const Text('')),
            imagePath: cubit.goldsModel[index].icon,
            goldsModel: cubit.goldsModel[index],
          ),
        );
      },
    );
  }
}
/*
 container: Padding(
                padding: EdgeInsets.only(left: 25.w), child: const Text('')),
* */
