import 'package:black_market/features/home/presentation/widgets/gold_widget/gold_clac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
