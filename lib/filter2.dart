// import 'package:flutter/material.dart';

// class ChartStack extends GetView<CurrenciesController> {
//   const ChartStack({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: 50.w, top: 35.h),
//           child: GetBuilder<CurrenciesController>(
//             id: "text_chart",
//             builder: (_) {
//               return Text(
//                 controller.textChart,
//                 style: TextStyle(
//                   color: AppColors.yellowDark,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.normal,
//                 ),
//               );
//             },
//           ),
//         ),
//         GetBuilder<CurrenciesController>(
//           id: "chart",
//           builder: (_) {
//             if (controller.valueTapBarPrice == 0 &&
//                 controller.valueTapBarDate == 0) {
//               controller.textChart = "";
//               controller.getHistoricalCurrencyLivePrices(
//                 controller.time.subtract(const Duration(days: 7)).toString(),
//               );
//               return ChartLive(
//                 livePricesMap: controller.livePricesMap,
//               );
//             } else if (controller.valueTapBarPrice == 0 &&
//                 controller.valueTapBarDate == 1) {
//               controller.textChart = "";
//               controller.getHistoricalCurrencyLivePrices(
//                 controller.time
//                     .subtract(
//                       const Duration(days: 30),
//                     )
//                     .toString(),
//               );

//               return ChartLive(
//                 livePricesMap: controller.livePricesMap,
//               );
//             } else if (controller.valueTapBarPrice == 1 &&
//                 controller.valueTapBarDate == 0) {
//               controller.getHistoricalCurrencyBlackPrices(
//                 controller.time.subtract(const Duration(days: 7)).toString(),
//               );
//               return ChartBlack(
//                 blackPricesMap: controller.blackPricesMap,
//               );
//             } else if (controller.valueTapBarPrice == 1 &&
//                 controller.valueTapBarDate == 1) {
//               controller.getHistoricalCurrencyBlackPrices(
//                 controller.time.subtract(const Duration(days: 30)).toString(),
//               );
//               return ChartBlack(
//                 blackPricesMap: controller.blackPricesMap,
//               );
//             } else {
//               return CircularProgressIndicator(
//                 color: AppColors.yellowDark,
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
// class TabBarDate extends GetView<CurrenciesController> {
//   const TabBarDate({required this.length, required this.tabs, super.key});
//   final int length;
//   final List<Widget> tabs;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         width: 290.w,
//         height: 30.h,
//         decoration: BoxDecoration(
//             color: AppColors.yellowNormal,
//             borderRadius: BorderRadius.circular(30.r)),
//         child: DefaultTabController(
//           length: length,
//           initialIndex: 0,
//           child: TabBar(
//             labelColor: AppColors.yellowNormal,
//             unselectedLabelColor: AppColors.gray,
//             tabs: tabs,
//             indicatorSize: TabBarIndicatorSize.tab,
//             dividerColor: Colors.transparent,
//             onTap: (value) {
//               if (value == 0) {
//                 controller.valueTapBarDate = value;
//               } else {
//                 controller.valueTapBarDate = value;
//               }
//             },
//             indicator: BubbleTabIndicator(
//               indicatorHeight: 25.0.h,
//               indicatorColor: AppColors.gray,
//               tabBarIndicatorSize: TabBarIndicatorSize.tab,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
