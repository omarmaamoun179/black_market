import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOfCalculator extends StatelessWidget {
  ItemOfCalculator({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
    required this.text,
    required this.sizedBox,
    this.widget,
  });
  double width;
  double height;
  Color color;
  BorderRadius borderRadius;
  String text;
  double sizedBox;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          widget ?? const Text(''),
          SizedBox(
            width: sizedBox,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0E0E0E),
            ),
          ),
        ],
      ),
    );
  }
}

