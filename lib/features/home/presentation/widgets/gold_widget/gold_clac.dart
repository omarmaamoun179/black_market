import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogWidget extends StatefulWidget {
  const CustomDialogWidget({
    super.key,
  });

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  bool isCalculated = false;
  String calculationResult = '';

  // Define controllers for the text fields
  TextEditingController priceController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  // Define a variable to store the selected karat
  String? selectedKarat;

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
          // Price TextField
          SizedBox(
            width: 291.w,
            height: 32.h,
            child: ClacTextField(
                text: 'السعر بالجنيه المصري', controller: priceController),
          ),
          SizedBox(
            height: 18.h,
          ),
          // Weight TextField
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 138.w,
                height: 32.h,
                child: ClacTextField(
                    text: 'الوزن بالجرام', controller: weightController),
              ),
              // Gold Karat DropdownButtonFormField
              SizedBox(
                width: 138.w,
                height: 33.h,
                child: DropdownButtonFormField(
                  menuMaxHeight: 250.h,
                  alignment: Alignment.centerLeft,
                  value: selectedKarat,
                  onChanged: (String? changevalue) {
                    setState(() {
                      selectedKarat = changevalue;
                      print(selectedKarat);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xff968787),
                  ),
                  iconSize: 10.sp,
                  elevation: 16,
                  borderRadius: BorderRadius.circular(6.r),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff968787),
                  ),
                  decoration: InputDecoration(
                    prefixText: selectedKarat,
                    prefixStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffFFFFFF),
                    ),
                    labelText: 'عيار الذهب',
                    labelStyle: TextStyle(
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
                  items: HomeCubit.get(context)
                      .goldsModel
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.centerLeft,
                      value: value.karat,
                      child: Text(
                        value.karat!,
                      ),
                    );
                    // Ensure uniqueness of values
                  }).toList(),
                  dropdownColor: const Color(0xff2A2A2A),
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
              onPressed: () {
                for (var e in HomeCubit.get(context).goldsModel) {
                  if (e.karat == selectedKarat) {
                    double price = double.parse(priceController.text);
                    double weight = double.parse(weightController.text);
                    double weight2 = weight * e.price!.price!;
                    double result = price - weight2;
                    print(result);
                    setState(() {
                      calculationResult =
                          'مصنعية ${weight.toStringAsFixed(1)} جرام ذهب هي ${result.toStringAsFixed(0)} جنيه مصري';
                    });
                  }
                }

                isCalculated = true;
                setState(() {});
              },
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
          SizedBox(
            height: 10.h,
          ),
          isCalculated == false || calculationResult.isEmpty
              ? const SizedBox()
              : Container(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  width: 291.w,
                  height: 40.h,
                  margin:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0xffFFC907),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          calculationResult,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0D0D0D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class ClacTextField extends StatelessWidget {
  const ClacTextField({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xffFFFFFF).withOpacity(.75),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(right: 10.w, bottom: 8.h),
        labelText: text,
        labelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff968787),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xff968787), width: .5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffFFC907), width: .5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
